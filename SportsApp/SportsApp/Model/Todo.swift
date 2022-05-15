//
//  Todo.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/15/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation


struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
