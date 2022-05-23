//
//  ComingEventsPresenter.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/14/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation

class ComingVCPresenter {
    
    private weak var view: ComingTableViewCell?
        private var service : NetworkManagerProtocol!
       private var latestEvent = [Event]()
       
       
       
       func attachView(view: ComingTableViewCell) {
           self.view = view
       }
       init (service : NetworkManagerProtocol!){
              self.service = service
          }
    
       func getUpcomingEvent (url: String, leaugeId: String){
           
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
       
       
       func getUpComingEvents() -> Int {
           return latestEvent.count
       }
       
        func configure(cell : ComingoCellCollectionView , index : Int) {
              let latestEvents = latestEvent[index]
              cell.awayTeamName(name: latestEvents.strAwayTeam ?? "away")
              cell.homeTeamName(name: latestEvents.strHomeTeam ?? "home")
              
           cell.eventImage(image: latestEvents.strThumb ?? "thumb.png")
              
             
          }
    
}
