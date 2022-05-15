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
        leagueNameLabel.text = ("\(name)")
    }
    
    
    

    @IBOutlet var leagueNameLabel: UILabel!
    
    @IBOutlet var roundLabel: UILabel!
    
    @IBOutlet var awayTeamImageView: UIImageView!
    
    
    @IBOutlet var homeTeamImageView: UIImageView!
    
    
    @IBOutlet var timeLabel: UILabel!
    
    
    @IBOutlet var dateLabel: UILabel!
    
    
    @IBOutlet var awayTeamLabel: UILabel!
    
    
    @IBOutlet var homeTeamLabel: UILabel!
    
    
    
    static let  ident = "comingCollectionCell"
       static func nib() -> UINib {
           return UINib(nibName: "ComingEventsCollectionViewCell", bundle: nil)
       }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(model : Model){
          self.leagueNameLabel.text = model.name
          self.awayTeamImageView.contentMode = .scaleAspectFit
        self.homeTeamLabel.contentMode = .scaleAspectFit

      }

   

}
