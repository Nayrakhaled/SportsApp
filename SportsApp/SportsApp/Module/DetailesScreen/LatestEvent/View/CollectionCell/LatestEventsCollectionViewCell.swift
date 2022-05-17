//
//  LatestEventsCollectionViewCell.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/14/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit

class LatestEventsCollectionViewCell: UICollectionViewCell,LatestCellCollectionView {
    
    
   
    
   
    

    @IBOutlet var homeTeamName: UILabel!
    
    @IBOutlet var homeImage: UIImageView!
    
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var awayName: UIImageView!
    
    @IBOutlet var awayTeamName: UILabel!
    
    
    static let  ident = "latestCollectionCell"
    static func nib() -> UINib {
        return UINib(nibName: "LatestEventsCollectionViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    func awayTeamName(name: String) {
         awayTeamName.text = name
     }
     
     func homeTeamName(name: String) {
         homeTeamName.text = name
     }
     
     func resultLabel(image: String) {
         resultLabel.text = image
     }
     

}
