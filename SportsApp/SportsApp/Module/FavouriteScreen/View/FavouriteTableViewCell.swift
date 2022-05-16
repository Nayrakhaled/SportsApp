//
//  FavouriteTableViewCell.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/16/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {
    
    var goToYoutube:(() -> Void)!

    @IBOutlet weak var nameLeagueLabel: UILabel!
    @IBOutlet weak var imageFavLeague: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func btnYoutube(_ sender: UIButton) {
        goToYoutube?()
    }
    
}
