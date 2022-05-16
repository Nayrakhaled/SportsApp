//
//  DBManager.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/16/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DBManager: DBManagerProtocol{
    
    var managerContext : NSManagedObjectContext!

    
    init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managerContext = appDelegate.persistentContainer.viewContext
    }
    
    
    func insertFavLeague(favLeague: League){
        
        let entity = NSEntityDescription.entity(forEntityName: "FavLeague", in: managerContext)
        let league = NSManagedObject(entity: entity!, insertInto: managerContext)
        league.setValue(favLeague.strLeague, forKey: "strLeague")
        league.setValue(favLeague.strYoutube, forKey: "strYoutube")
        league.setValue(favLeague.strBadge, forKey: "strBadge")
        do{
                try managerContext.save()
            }catch{
                  print(error.localizedDescription)
            }
    }
    
    func getFavLeague() -> [League]{
        let fetchingMov = NSFetchRequest<NSManagedObject>(entityName: "FavLeague")
        var leagueArray = [League]()
          do{
              let returnedArray = try managerContext.fetch(fetchingMov)
              print(returnedArray.count)
              for i in stride(from: 0, to: returnedArray.count, by: 1){
                  let obj = League()
                  obj.strBadge = returnedArray[i].value(forKey: "strBadge") as? String
                  obj.strLeague = returnedArray[i].value(forKey: "strLeague") as? String
                  obj.strYoutube = returnedArray[i].value(forKey: "strYoutube") as? String
                  leagueArray.append(obj)
              }
          }catch{
              print(error.localizedDescription)
          }
        return leagueArray
      }
    
    func deleteFavLeague(position: Int){
        let fetchingMov = NSFetchRequest<NSManagedObject>(entityName: "FavLeague")
                 do{
                     let returnedArray = try managerContext.fetch(fetchingMov)
                    managerContext.delete(returnedArray[position])
                try managerContext.save()
            }catch {
                print("NotDelete.....")
        }
    }
}
