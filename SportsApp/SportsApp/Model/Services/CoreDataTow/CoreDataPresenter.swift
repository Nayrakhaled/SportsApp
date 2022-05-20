//
//  CoreDataPresenter.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/20/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation


protocol CoreDataPresenterProtocol {
     func getFavLeague ()
     func deleteFavLeague(fav: SavingLeague)
     func attachView(view: FavLeagueProtocol)
}

class CoreDataPresenter :CoreDataPresenterProtocol
{
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
            self.view.renderTableViewWithFav(fav: leagueArray)
                          
           }
       }
       
       func deleteFavLeague(fav: SavingLeague) {
          db.delete(league: fav)

       }
       
}
