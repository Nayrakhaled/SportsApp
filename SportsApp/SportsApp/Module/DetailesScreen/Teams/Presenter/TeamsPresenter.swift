//
//  TeamsPresenter.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/14/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation


protocol TeamsViewCell: class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError()
    func configTableCell(Team:[Team])
    
}

protocol TeamsCellCollectionView {
    //func configTableCell (todo :[Todo]!)
    func labelname (name :String)
    func teamImage (image : String)
}



class TeamsVCPresenter {
    
    private weak var view: TeamsViewCell?
    
    private var service : NetworkManagerProtocol!
    private var teams = [Team]()
    
    
    
     func attachView (view: TeamsViewCell) {
        self.view = view
    }
     init (service : NetworkManagerProtocol!){
        self.service = service
    }
    
    
   
    
    func getAllTeams (url: String, sportName: String,sportContury:String){
     
        view?.showIndicator()
        service.loadData(url: url, param: ["s": sportName,"c":sportContury], responseType: AllTeams.self) { (Allteams, error) in
            
            print("Completion handler ")
                     
                self.view?.hideIndicator()
                     
                if let error = error {
                         self.view?.showError()
                     } else {
                         guard let allTeams = Allteams else { return }
                         self.teams = allTeams.teams
                    self.view?.configTableCell(Team: self.teams)
                        // self.view?.fetchingDataSuccess()
                     }
                
            }
        }
    
  
    
    func getTeamCount() -> Int {
        return teams.count
    }
    
    func configure(cell : TeamsCellCollectionView , index : Int) {
        let team = teams[index]
        cell.labelname(name: team.strTeam ?? "nil")
        cell.teamImage(image: team.strTeamBadge ?? "car.png")
       
    }
    
}
