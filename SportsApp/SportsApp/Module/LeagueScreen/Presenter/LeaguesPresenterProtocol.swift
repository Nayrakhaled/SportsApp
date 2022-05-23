//
//  LeaguesPresenterProtocol.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/23/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation


protocol LeaguesPresenterProtocol{
    func getLeagues(url: String, sportName: String)
    func attachView(view: LeaguesProtocol)
}
