//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Руслан Акберов on 29.10.2017.
//  Copyright © 2017 Ruslan Akberov. All rights reserved.
//
//

import Foundation
import CoreData


public class Item: NSManagedObject {
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
    }
    
    

}
