//
//  News.swift
//  NewsApp
//
//  Created by Lourenço Gomes on 16/03/18.
//  Copyright © 2018 Lourenço Gomes. All rights reserved.
//

import Foundation

class News{
    
    public var title        : String?
    public var description  : String?
    public var url          : String?
    public var urlToImage   : String?
    
    public static func newsFromDictionary ( _ dictionary : Dictionary<String, Any> ) -> News {
        let news : News = News ()
        
        news.title       = dictionary["title"        ] as? String
        news.description = dictionary["description"  ] as? String
        news.url         = dictionary["url"          ] as? String
        news.urlToImage  = dictionary["urlToImage"   ] as? String
        
        return news
    }
    
}
