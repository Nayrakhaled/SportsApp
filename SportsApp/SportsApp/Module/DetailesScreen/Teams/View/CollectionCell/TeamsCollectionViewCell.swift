//
//  TeamsCollectionViewCell.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/14/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell ,TeamsCellCollectionView{
    func labelname(name: Int) {
        teamNameImage.text = "\(name)"
    }
    
   
    
//teamCollectionCell
    
    @IBOutlet var teamNameImage: UILabel!
    @IBOutlet var teamImage: UIImageView!
    
    static let  ident = "teamCollectionCell"
    static func nib() -> UINib {
        return UINib(nibName: "TeamsCollectionViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func configure(model : Model){
        self.teamNameImage.text = model.name
        self.teamImage.contentMode = .scaleAspectFit
    }

    
}
