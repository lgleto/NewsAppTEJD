//
//  Category+CoreDataProperties.swift
//  NewsApp
//
//  Created by Lourenço Gomes on 20/03/18.
//  Copyright © 2018 Lourenço Gomes. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var title: String?
    @NSManaged public var news: NSSet?

}

// MARK: Generated accessors for news
extension Category {

    @objc(addNewsObject:)
    @NSManaged public func addToNews(_ value: News)

    @objc(removeNewsObject:)
    @NSManaged public func removeFromNews(_ value: News)

    @objc(addNews:)
    @NSManaged public func addToNews(_ values: NSSet)

    @objc(removeNews:)
    @NSManaged public func removeFromNews(_ values: NSSet)

}
