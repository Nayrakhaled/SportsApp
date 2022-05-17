//
//  LatestEventsCollectionViewCell.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/14/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit
import Kingfisher
class LatestEventsCollectionViewCell: UICollectionViewCell,LatestCellCollectionView {
  
  
    @IBOutlet var eventImage: UIImageView!
    
    @IBOutlet var awayTeamNameLabel: UILabel!
    
    @IBOutlet var resultEventLabel: UILabel!
    
    @IBOutlet var eventName: UILabel!
    
    @IBOutlet var homeTeamNameLabel: UILabel!
    
    //xib collection
    static let  ident = "latestCollectionCell"
    static func nib() -> UINib {
        return UINib(nibName: "LatestEventsCollectionViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //presenter functions 
   
    func awayTeamName(name: String) {
         awayTeamNameLabel.text = name
     }
     
     func homeTeamName(name: String) {
         homeTeamNameLabel.text = name
     }
     
     func resultLabel(name: String) {
         resultEventLabel.text = name
     }
     
     func eventImage(image: String) {
        eventImage.kf.setImage(with: URL(string:image), placeholder: UIImage(named: "car.png"))

       }
       
       func eventName(name: String) {
        eventName.text = name
       }

}
