//
//  FavouritePresenter.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/16/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation
import CoreData

protocol FavLeaguePresenterProtocol {
    
    func getFavLeague()
    func deleteFavLeague(position: Int)
    func attachView(view: FavLeagueProtocol)
}


class FavLeaguePresenter: FavLeaguePresenterProtocol{
    
    var db : DBManagerProtocol!
    var view : FavLeagueProtocol!

    init(db: DBManagerProtocol) {
        self.db = db
    }
    
    func attachView(view: FavLeagueProtocol) {
        self.view = view
    }

    
    func getFavLeague() {
        let leagueArray = db.getFavLeague()
        DispatchQueue.main.async {
            self.view.renderTableView(league: leagueArray)
                       
        }
    }
    
    func deleteFavLeague(position: Int) {
        db.deleteFavLeague(position: position)

    }
    
    
}
