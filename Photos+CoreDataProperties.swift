//
//  Photos+CoreDataProperties.swift
//  Your Valult
//
//  Created by amrit on 3/11/16.
//  Copyright © 2016 Amrit. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Photos {

    @NSManaged var photo: NSData?
    @NSManaged var picname: String?

}
