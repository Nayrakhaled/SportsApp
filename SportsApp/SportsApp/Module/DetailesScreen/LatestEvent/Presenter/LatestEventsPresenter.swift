//
//  LatestEventsPresenter.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/14/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation



protocol LatestViewCell: class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError()
}

protocol LatestCellCollectionView {
    func awayTeamName (name :String)
    func homeTeamName (name :String)
    func resultLabel (name :String)
    func eventImage (image :String)
    func eventName (name :String)
}

class LatestVCPresenter {
    
    private weak var view: LatestViewCell?
     private var service : NetworkManagerProtocol!
    private var latestEvent = [Event]()
    
    
    
    func attachView(view: LatestViewCell) {
        self.view = view
    }
    init (service : NetworkManagerProtocol!){
           self.service = service
       }
    
   
   
    
    func getLastestEvents (url: String, leaugeId: String){
        
           view?.showIndicator()
           service.loadData(url: url, param: ["id": leaugeId], responseType: EventResponse.self) { (lastestEvent, error) in
               
               print("Completion handler ")
                        
                    self.view?.hideIndicator()
                             
                            if let error = error {
                                 self.view?.showError()
                             } else {
                                guard let latestEvent = lastestEvent else { return }
                                 self.latestEvent = latestEvent.events
                                 print("Completion handler success \(self.latestEvent.count)")
                                 self.view?.fetchingDataSuccess()
                             }
                   
               }
           }
    
    
    func getLatestEventsCount() -> Int {
        return latestEvent.count
    }
    
     func configure(cell : LatestCellCollectionView , index : Int) {
           let latestEvents = latestEvent[index]
           cell.awayTeamName(name: latestEvents.strAwayTeam ?? "away")
           cell.homeTeamName(name: latestEvents.strHomeTeam ?? "home")
           cell.resultLabel(name:"\(latestEvents.intAwayScore ?? "0") :\(latestEvents.intHomeScore ?? "0")")
           cell.eventName(name: latestEvents.strEvent ?? "vs")
        cell.eventImage(image: latestEvents.strThumb ?? "thumb.png")
           
          
       }
}
