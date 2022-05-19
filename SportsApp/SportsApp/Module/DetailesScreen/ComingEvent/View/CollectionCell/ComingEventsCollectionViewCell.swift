//
//  ComingEventsCollectionViewCell.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/14/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit

class ComingEventsCollectionViewCell: UICollectionViewCell,ComingoCellCollectionView{
    func labelname(name: Int) {
        UcomingNameEvent.text = ("\(name)")
    }
    
    
    

    @IBOutlet var upcomingImage: UIImageView!
    
    @IBOutlet var UcomingNameEvent: UILabel!
    
    
    @IBOutlet var awayNameTeam: UILabel!
    
    @IBOutlet var eventTime: UILabel!
    
    
    @IBOutlet var eventDate: UILabel!
    
    
    @IBOutlet var homeNameTeam: UILabel!
    
    static let  ident = "comingCollectionCell"
       static func nib() -> UINib {
           return UINib(nibName: "ComingEventsCollectionViewCell", bundle: nil)
       }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
   

   

}
