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
        NWService.getAllSports(url: url, complitionHandler: { [weak self](sport, error) in
            
            print(sport?[0].strSport ?? "")
            self?.sport = sport
                       
            DispatchQueue.main.async {
            self?.view.stopAnimating()
                self?.view.renderCollectionView(sport: self!.sport)
                          
            }
        })
    }
}
