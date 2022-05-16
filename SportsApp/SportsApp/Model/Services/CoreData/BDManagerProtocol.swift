//
//  BDManagerProtocol.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/16/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation
import CoreData

protocol DBManagerProtocol{
 
    func insertFavLeague(favLeague: League)
    func getFavLeague() -> [League]
    func deleteFavLeague(position: Int)
    
}
