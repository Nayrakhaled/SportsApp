//
//  DetailesScreenPresenter.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/21/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation

import CoreData

protocol detailesScreenViewProtocol {
    func print()
}

protocol DetailesScreenPresenterProtocol {
    
    func insertLeauge (leauge :String , youtube :String ,padge :String,id:String,country:String,strSport :String)
    func deleteFavLeague(fav: SavingLeague)
    func attachView(view: detailesScreenViewProtocol)
  //  func addLeague (fav :SavingLeague)
}


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
     
   // func addLeague(fav: SavingLeague) {
     //   db.insertLeaguee(favLeague: fav)
      //}
      
    
}
