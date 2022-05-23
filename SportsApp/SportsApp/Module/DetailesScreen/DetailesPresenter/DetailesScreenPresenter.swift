//
//  DetailesScreenPresenter.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/21/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation
import CoreData

class DetailesSccreenPresenter: DetailesScreenPresenterProtocol {
   
    var db : CoreDataProtocol!
    var view : detailesScreenViewProtocol!

    init(db: CoreDataProtocol) {
        self.db = db
    }
    
    func attachView(view: detailesScreenViewProtocol) {
        self.view = view
    }
  
    
    func deleteFavLeague(fav: SavingLeague){
        db.delete(league: fav)
    }
    
    func insertLeauge(leauge :String , youtube :String ,padge :String,id:String,country:String,strSport :String) {
        
        db.addLeague(leauge: leauge, youtube: youtube, padge: padge, id: id, country: country, strSport: strSport)
     }
    
    func deleteFuncById (idLeague:String){
      let thereIs =  db.checkIfLeagueInFavById(id: idLeague)
        if thereIs == true {
          let deletedLeague =  db.getDeletedLeague(id: idLeague)
            db.delete(league: deletedLeague)
        }
        else {
            print("failed to delete")
        }
    }
    
}
