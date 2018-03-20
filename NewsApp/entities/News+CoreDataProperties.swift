//
//  News+CoreDataProperties.swift
//  NewsApp
//
//  Created by Lourenço Gomes on 20/03/18.
//  Copyright © 2018 Lourenço Gomes. All rights reserved.
//
//

import Foundation
import CoreData


extension News {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<News> {
        return NSFetchRequest<News>(entityName: "News")
    }

    @NSManaged public var detail: String?
    @NSManaged public var urlToImage: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var category: Category?

}
