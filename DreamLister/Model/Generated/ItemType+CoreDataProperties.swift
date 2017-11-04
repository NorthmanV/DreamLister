//
//  ItemType+CoreDataProperties.swift
//  DreamLister
//
//  Created by Руслан Акберов on 29.10.2017.
//  Copyright © 2017 Ruslan Akberov. All rights reserved.
//
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType")
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
