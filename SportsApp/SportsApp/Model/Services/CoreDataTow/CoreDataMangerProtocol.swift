//
//  CoreDataMangerProtocol.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/19/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation

protocol CoreDataProtocol {
    func addLeague (leauge :String , youtube :String ,padge :String,id:String,country:String,strSport :String)
    func  getAllLeague () -> [SavingLeague]
    func delete (league : SavingLeague)
}
