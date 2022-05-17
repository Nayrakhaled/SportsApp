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
}

protocol TeamsCellCollectionView {
    //func configTableCell (todo :[Todo]!)
    func labelname (name :String)
    func teamImage (image : String)
}

//https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?s=Soccer&c=England


class TeamsVCPresenter {
    
    private weak var view: TeamsViewCell?
    private let interactor = TodosInteractor(baseUrl: "https://www.thesportsdb.com/api/v1/json/2/")
    private var teams = [Team]()
    
    init(view: TeamsViewCell) {
        self.view = view
    }
    
    func viewDidLoad() {
        getTeams()
    }
    
    func getTeams(){
        view?.showIndicator()
        interactor.getTeams(endPoint: "search_all_teams.php?s=Soccer&c=England", completionHandler: { [weak self] Allteams, error in
            
            print("Completion handler ")
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            
            if let error = error {
                self.view?.showError()
            } else {
                guard let allTeams = Allteams else { return }
                self.teams = allTeams.teams
               
                self.view?.fetchingDataSuccess()
            }
        })
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
