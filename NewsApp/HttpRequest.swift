//
//  HttpRequest.swift
//  NewsApp
//
//  Created by Lourenço Gomes on 13/03/18.
//  Copyright © 2018 Lourenço Gomes. All rights reserved.
//

import Foundation

let BASE_API = "https://newsapi.org/v2/"
let ENDPOINT_SPORTS = "top-headlines?country=pt&category=sports"
let ENDPOINT_BUSINESS = "top-headlines?country=pt&category=business"
let API_KEY = "&apiKey=1765f87e4ebc40229e80fd0f75b6416c"

class HttpRequest {
    
    static let sharedInstance : HttpRequest = HttpRequest()
    
    public func getAllNews(endpoint: String , result: @escaping ([[String:AnyObject]])->() ){
        
        let urlAndEndPoint : String  = BASE_API + endpoint + API_KEY
        
        guard let url = URL(string: urlAndEndPoint) else {
            print ("O endereço não é válido")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod="GET"
        
        let config =  URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest){
            data, response, error in
            
            guard error == nil else {
                print ("bad request")
                print (error!)
                return
            }
            
            guard let responseData = data else {
                print ("sem dados")
                return
            }
            
            //let dataStr = String.init(data: responseData, encoding: String.Encoding.utf8)
            //print(dataStr!)
            //result(dataStr!)
            
            
            do {
                guard let jsonData = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String:AnyObject] else {
                    return 
                }
                if jsonData["status"]! as! String == "ok" {
                    let newsArray : [[String:AnyObject]] = (jsonData["articles"] as? [[String:AnyObject]])!
                    //print (newsArray)
                    
                    result(newsArray)
                }
                print (jsonData["status"]!)
            
            }catch{
                 print ("erro na conversão do json")
            }
            
            
        }
        task.resume()
        
    }
}
