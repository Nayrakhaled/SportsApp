//
//  HomePresenter.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/13/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation

protocol HomePresenterProtocol{
    func getHomeSports(url: String)
    func attachView(view: HomeProtocol)
}

class HomePresenter: HomePresenterProtocol {
    
    var NWService : NetworkManagerProtocol! // service
    var sport : [Sport]! // model
    weak var view : HomeProtocol!  // DI
    
    init(NWService : NetworkManagerProtocol){
        self.NWService = NWService
    }
    
    func attachView(view: HomeProtocol){
        self.view = view
    }
    
    func getHomeSports(url: String){
        NWService.loadData(url: url, param: [:], responseType: AllSports.self) { (sports, error) in
            print(sports?.sports?[0].strSport ?? "")
            self.sport = sports?.sports
                                      
                DispatchQueue.main.async {
                self.view.stopAnimating()
            self.view.renderCollectionView(sport: self.sport)
                }
        }
    }
    
}
