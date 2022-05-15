//
//  LatestEventsCollectionViewCell.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/14/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit

class LatestEventsCollectionViewCell: UICollectionViewCell,TodoCellCollectionView {
    func labelname(name: Int) {
        self.homeTeamName.text = ("\(name)")
        print("\(name)")
    }
    
   
    
   
    

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
    public func configure(model : Model){
        self.homeTeamName.text = model.name
        self.homeImage.contentMode = .scaleAspectFit
        self.awayName.contentMode = .scaleAspectFit
    }

}
