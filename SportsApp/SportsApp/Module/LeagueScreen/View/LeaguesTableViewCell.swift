//
//  LeaguesTableViewCell.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/13/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageLeague: UIImageView!
    
    @IBOutlet weak var labelLeagueName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func buttonYoutube(_ sender: UIButton) {
    }
    
    
}
