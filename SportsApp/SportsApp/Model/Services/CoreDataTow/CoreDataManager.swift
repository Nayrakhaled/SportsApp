//
//  CoreDataMager.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/19/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManger : CoreDataProtocol{
   
    
  
    
   
 
   static let sharedInstance = CoreDataManger(context: NSManagedObjectContext())
    var context: NSManagedObjectContext!
    var FavLeagues = [SavingLeague]()
  
    
    init(context:NSManagedObjectContext){
        self.context = context
    }
    
     func addLeague (leauge :String , youtube :String ,padge :String,id:String,country:String,strSport :String){
        let favLeague = SavingLeague (context: context)
        
        favLeague.league = leauge
        favLeague.youtube = youtube
        favLeague.padge = padge
        favLeague.id = id
        favLeague.country = country
        favLeague.sportName = strSport
        do{
                   try context.save()
            print("done in core data \(String(describing: favLeague.league))")
                   getAllLeague()
               }
               catch{
                   
               }
        
    }
    
        func  getAllLeague () -> [SavingLeague]{
          do {
              
           FavLeagues =  try context.fetch(SavingLeague.fetchRequest())
            
          
          }
          catch{
              //error
          }
              return FavLeagues
          }
    
    func delete (league : SavingLeague){
          
          context.delete(league)
          
          do{
              try context.save()
              getAllLeague()

                }
              catch{
              
          }
          
      }
    func checkIfLeagueInFavById (id :String) -> Bool {
        
        let leagues = getAllLeague()
        for league in leagues {
            if league.id == id {
                print("league deleted from list and id id : \(id)")
                return true
            }
           
            
        }
        print(" this league in not there")
        return false
    }
    
    func getDeletedLeague (id :String)-> SavingLeague{
        
        var deletedLeague : SavingLeague!
        let leagues = getAllLeague()

        for league in leagues {
            if league.id == id{
                deletedLeague = league
            }
            
        }
        return deletedLeague
    }

    
    
    
    

    
    
}
