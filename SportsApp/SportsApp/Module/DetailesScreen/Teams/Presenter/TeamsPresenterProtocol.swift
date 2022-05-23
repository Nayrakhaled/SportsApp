//
//  TeamsPresenterProtocol.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/23/22.
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
