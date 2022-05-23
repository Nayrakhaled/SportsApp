//
//  DeatilsPresenterProtocol.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/23/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation


protocol detailesScreenViewProtocol {
    func print()
}

protocol DetailesScreenPresenterProtocol {
    
    func insertLeauge (leauge :String , youtube :String ,padge :String,id:String,country:String,strSport :String)
    func deleteFavLeague(fav: SavingLeague)
    func attachView(view: detailesScreenViewProtocol)
    func deleteFuncById (idLeague:String)
}
