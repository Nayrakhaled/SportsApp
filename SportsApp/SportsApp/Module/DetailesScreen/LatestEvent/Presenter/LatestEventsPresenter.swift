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
    //func configTableCell (todo :[Todo]!)
    func awayTeamName (name :String)
    func homeTeamName (name :String)
    func resultLabel (name :String)
    func eventImage (image :String)
    func eventName (name :String)
}

//https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=4328
class LatestVCPresenter {
    
    private weak var view: LatestViewCell?
    private let interactor = TodosInteractor(baseUrl: "https://www.thesportsdb.com/api/v1/json/2/")
    private var latestEvent = [Event]()
    
    init(view: LatestViewCell) {
        self.view = view
    }
    
    func viewDidLoad() {
        getLatestEvent()
    }
    
    func getLatestEvent(){
        view?.showIndicator()
        interactor.getLatestEvents(endPoint: "eventsseason.php?id=4328", completionHandler: { [weak self] latestEvent, error in
            
            print("Completion handler ")
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            
            if let error = error {
                self.view?.showError()
            } else {
                guard let latestEvent = latestEvent else { return }
                self.latestEvent = latestEvent.events
                print("Completion handler success \(self.latestEvent.count)")
                self.view?.fetchingDataSuccess()
            }
        })
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
