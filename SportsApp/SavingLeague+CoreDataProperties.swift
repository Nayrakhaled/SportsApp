//
//  SavingLeague+CoreDataProperties.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/19/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//
//

import Foundation
import CoreData


extension SavingLeague {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavingLeague> {
        return NSFetchRequest<SavingLeague>(entityName: "SavingLeague")
    }

    @NSManaged public var youtube: String?
    @NSManaged public var padge: String?
    @NSManaged public var league: String?

}
