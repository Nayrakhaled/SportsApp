//
//  FavouritePresenter.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/16/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation
import CoreData

class FavLeaguePresenter: FavLeaguePresenterProtocol{
    
    var db : CoreDataProtocol!
    var view : FavLeagueProtocol!

    init(db: CoreDataProtocol) {
        self.db = db
    }
    
    func attachView(view: FavLeagueProtocol) {
        self.view = view
    }

    
    func getFavLeague() {
        let leagueArray = db.getAllLeague()
        DispatchQueue.main.async {
           self.view.renderTableView(fav: leagueArray)
        }
    }
        
    
    func deleteFavLeague(fav: SavingLeague){
        db.delete(league: fav)
    }
}
