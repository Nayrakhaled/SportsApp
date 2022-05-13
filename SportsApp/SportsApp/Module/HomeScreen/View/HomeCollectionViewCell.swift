//
//  HomeCollectionView.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/12/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
   
    @IBOutlet weak var sportNameLabel: UILabel!
    @IBOutlet weak var imageHome: UIImageView!
    
    
    func setSportName(name: String){
        sportNameLabel.text = name
    }
    func setImageHome(url: String){
        imageHome.kf.setImage(with: URL(string: url), placeholder: UIImage(named: "car.png"))
    }
}
