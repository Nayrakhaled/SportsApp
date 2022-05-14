//
//  LeaguesPresenter.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/13/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation


protocol LeaguesPresenterProtocol{
    func getLeagues(url: String)
    func attachView(view: LeaguesProtocol)
}

class LeaguesPresenter: LeaguesPresenterProtocol {
    
    var NWService : NetworkManagerProtocol! // service
    var league : [League]! // model
    var view : LeaguesProtocol!  // DI
    
    init(NWService : NetworkManagerProtocol){
        self.NWService = NWService
    }
    
    func attachView(view: LeaguesProtocol){
        self.view = view
    }
    
    func getLeagues(url: String){
        NWService.getAllLeagues(url: url, complitionHandler: { [weak self](league, error) in
            
            print(league?[0].strLeague ?? "")
            self?.league = league
                       
            DispatchQueue.main.async {
            self?.view.stopAnimating()
            self?.view.renderTableView(league: self!.league)
                          
            }
        })
    }
}
