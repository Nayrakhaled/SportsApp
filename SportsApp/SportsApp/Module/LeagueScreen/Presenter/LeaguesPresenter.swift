//
//  LeaguesPresenter.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/13/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation

class LeaguesPresenter: LeaguesPresenterProtocol {
    
    var NWService : NetworkManagerProtocol! // service
    var league : [League]! // model
    weak var view : LeaguesProtocol!  // DI
    
    init(NWService : NetworkManagerProtocol){
        self.NWService = NWService
    }
    
    func attachView(view: LeaguesProtocol){
        self.view = view
    }
    
    func getLeagues(url: String, sportName: String){
        NWService.loadData(url: url, param: ["s": sportName], responseType: AllLeagues.self) { (leagues, error) in print(leagues?.countries![0].strLeague ?? "")
            self.league = leagues?.countries
                                          
            DispatchQueue.main.async {
                self.view.stopAnimating()
            self.view.renderTableView(league: self.league)
                
            }
        }
    }
}
