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
    
    func addLeague (leauge :String , youtube :String ,padge :String){
        let favLeague = SavingLeague (context: context)
        
        favLeague.league = leauge
        favLeague.youtube = youtube
        favLeague.padge = padge
        do{
                   try context.save()
            print("done in core data \(favLeague.league)")
                   getAllaTasks()
               }
               catch{
                   
               }
        
    }
    
        func  getAllaTasks () -> [SavingLeague]{
          do {
              
           FavLeagues =  try context.fetch(SavingLeague.fetchRequest())
            
          
          }
          catch{
              //error
          }
              return FavLeagues
          }
    
    func delete (league : FavLeague){
          
          context.delete(league)
          
          do{
              try context.save()
              getAllaTasks()

                }
              catch{
              
          }
          
      }

    
    
}
