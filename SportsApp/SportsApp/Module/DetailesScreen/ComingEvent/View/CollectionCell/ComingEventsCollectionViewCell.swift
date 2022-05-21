//
//  ComingEventsCollectionViewCell.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/14/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit

class ComingEventsCollectionViewCell: UICollectionViewCell,ComingoCellCollectionView{
    func awayTeamName(name: String) {
        awayTeamName.text = name
    }
    
    func homeTeamName(name: String) {
        homeTeamName.text = name
    }
    
   
    
    func eventImage(image: String) {
        upcomingImage.kf.setImage(with: URL(string:image), placeholder: UIImage(named: "car.png"))
    }
    
    
    
   
    
    
    

    @IBOutlet var upcomingImage: UIImageView!
    
    @IBOutlet var UcomingNameEvent: UILabel!
    
    
    @IBOutlet var awayTeamName: UILabel!
    
    @IBOutlet var homeTeamName: UILabel!
    
    static let  ident = "comingCollectionCell"
       static func nib() -> UINib {
           return UINib(nibName: "ComingEventsCollectionViewCell", bundle: nil)
       }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
   

   

}
