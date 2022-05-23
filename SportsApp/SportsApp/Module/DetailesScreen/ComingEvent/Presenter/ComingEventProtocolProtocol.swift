//
//  ComingEventProtocol.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/23/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation

protocol ComingTableViewCell: class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError()
}

protocol ComingoCellCollectionView {
    func awayTeamName (name :String)
     func homeTeamName (name :String)
     func eventImage (image :String)
    
}
