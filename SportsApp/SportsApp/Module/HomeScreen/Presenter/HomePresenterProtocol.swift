//
//  HomePresenterProtocol.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/23/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation


protocol HomePresenterProtocol{
    func getHomeSports(url: String)
    func attachView(view: HomeProtocol)
}
