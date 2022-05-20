//
//  SavingLeague+CoreDataProperties.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/20/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//
//

import Foundation
import CoreData


extension SavingLeague {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavingLeague> {
        return NSFetchRequest<SavingLeague>(entityName: "SavingLeague")
    }

    @NSManaged public var country: String?
    @NSManaged public var id: String?
    @NSManaged public var league: String?
    @NSManaged public var padge: String?
    @NSManaged public var youtube: String?
    @NSManaged public var sportName: String?

}
