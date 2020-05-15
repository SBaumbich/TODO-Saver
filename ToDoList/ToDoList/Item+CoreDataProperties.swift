//
//  Item+CoreDataProperties.swift
//  ToDoList
//
//  Created by Scott Baumbich on 5/6/20.
//  Copyright © 2020 Keasbey Nights. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        let request = NSFetchRequest<Item>(entityName: "Item")
        request.sortDescriptors = [NSSortDescriptor(key: "text", ascending: true)]
        
        return request
    }

    @NSManaged public var isCompleated: Bool
    @NSManaged public var text: String

}
