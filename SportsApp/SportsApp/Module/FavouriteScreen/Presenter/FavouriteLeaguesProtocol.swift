//
//  FavouriteLeaguesProtocol.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/23/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation


protocol FavLeaguePresenterProtocol {
    
    func getFavLeague ()
    func deleteFavLeague(fav: SavingLeague)
    func attachView(view: FavLeagueProtocol)
}
