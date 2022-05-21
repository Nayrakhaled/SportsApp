//
//  Constants.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/12/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation
import Network

class Constants{
  
    static let BASE_URL = "https://www.thesportsdb.com/api/v1/json/2/"
    static let ALLSPORTS = "all_sports.php"
    static let ALLLEAGUES = "search_all_leagues.php"
    static let AllTeams = "search_all_teams.php"
    static let LatestEvent = "eventsseason.php"
    
    static func checkConnection() -> Bool{
        let monitor = NWPathMonitor()
        var flag: Bool = false

        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied{
                flag = true
            }else{
                flag = false
            }
        }
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
        monitor.start(queue: queue)
        return flag
    }
    
    
}
