//
//  TeamsCollectionViewCell.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/14/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell ,TeamsCellCollectionView{
  
  
    @IBOutlet var teamNameImage: UILabel!
    @IBOutlet var teamImage: UIImageView!
    
    //nib collection cell
    static let  ident = "teamCollectionCell"
    static func nib() -> UINib {
        return UINib(nibName: "TeamsCollectionViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    
    //presenter function
    func teamImage(image: String) {
           teamImage.kf.setImage(with: URL(string:image), placeholder: UIImage(named: "car.png"))
       }
       
    func labelname(name: String) {
             teamNameImage.text = name
                 print(name)
               //  teamImage.kf.setImage(with: URL(string:image ), placeholder: UIImage(named: "car.png"))
       }

    
}
