//
//  NetworkManagerProtocol.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/12/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation

protocol NetworkManagerProtocol {
    func getHome(url: String, complitionHandler: @escaping ([Sport]?,Error?)->Void)
}
