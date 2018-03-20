//
//  News+CoreDataClass.swift
//  NewsApp
//
//  Created by Lourenço Gomes on 20/03/18.
//  Copyright © 2018 Lourenço Gomes. All rights reserved.
//
//

import Foundation
import CoreData

@objc(News)
public class News: NSManagedObject {

    public static func newsFromDictionary ( _ dictionary : Dictionary<String, Any> ) -> News {
        let news : News = News ()
        
        news.title       = dictionary["title"        ] as? String
        news.detail      = dictionary["description"  ] as? String
        news.url         = dictionary["url"          ] as? String
        news.urlToImage  = dictionary["urlToImage"   ] as? String
        
        return news
    }
    
    public static func addNewsFromDictionary ( _ dictionary : Dictionary<String, Any>, context: NSManagedObjectContext) -> News? {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "News")
        request.predicate =  NSPredicate(format: "url = %@", (dictionary["url" ] as? String)!)
        
        
        if let _ = (try? context.fetch(request).first as? News  ){
            return News.updateNewsFromDictionary(dictionary, context:context)
            
        }else {
            if let news = NSEntityDescription.insertNewObject(forEntityName: "News", into: context) as? News {
                
                news.title       = dictionary["title"        ] as? String
                news.detail      = dictionary["description"  ] as? String
                news.url         = dictionary["url"          ] as? String
                news.urlToImage  = dictionary["urlToImage"   ] as? String
                news.isFavorite  = false
                
                return news
            }
        
        }
    
        return nil

    }
    
    public static func updateNewsFromDictionary ( _ dictionary : Dictionary<String, Any>, context: NSManagedObjectContext) -> News? {
        
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "News")
        request.predicate =  NSPredicate(format: "url = %@", (dictionary["url" ] as? String)!)
        
        if let news = (try? context.fetch(request).first as? News  ){
            
            news?.title       = dictionary["title"        ] as? String
            news?.detail      = dictionary["description"  ] as? String
            news?.url         = dictionary["url"          ] as? String
            news?.urlToImage  = dictionary["urlToImage"   ] as? String
            news?.isFavorite  = false
            
            return news
        }
        
        return nil;
        
    }
    
}
