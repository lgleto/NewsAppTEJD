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
    
    let bookmarked = UIImage(named: "ic_bookmark")
    let unBookmarked = UIImage(named: "ic_bookmark_border")
    
    private var _news: News?

    var news : News {
        get{
            return _news!
        }
        set{
            _news =  newValue
        }
    }
    
    @IBOutlet weak var bookMarkButton: UIBarButtonItem!
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func bookMarkButtonTouched(_ sender: UIBarButtonItem) {
        self._news?.isFavorite = !(self._news?.isFavorite)!
        bookMarkButton.image = (_news?.isFavorite)! ? bookmarked : unBookmarked
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            appDelegate.saveContext()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print (_news!.url ?? "")

        if let url = URL(string: _news!.url!) {
            webView.load(URLRequest.init(url: url))
        }
        
        self.title = _news?.title?.tenChar()
        
        bookMarkButton.image = (_news?.isFavorite)! ? bookmarked : unBookmarked
        

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

extension String {
    func tenChar () -> String{
        return String(self.prefix(10))
    }
}
