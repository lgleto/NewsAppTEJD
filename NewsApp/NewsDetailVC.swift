//
//  NewsDetailVC.swift
//  NewsApp
//
//  Created by Lourenço Gomes on 20/03/18.
//  Copyright © 2018 Lourenço Gomes. All rights reserved.
//

import UIKit
import WebKit

class NewsDetailVC: UIViewController {
    
    private var _news: News?

    var news : News {
        get{
            return _news!
        }
        set{
            _news =  newValue
        }
    }
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print (_news!.url ?? "")

        if let url = URL(string: _news!.url!) {
            webView.load(URLRequest.init(url: url))
        }
        
        self.title = _news?.title
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
