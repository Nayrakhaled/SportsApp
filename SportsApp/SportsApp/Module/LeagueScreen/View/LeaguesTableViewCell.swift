//
//  LeaguesTableViewCell.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/16/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    var goToYoutube :(() ->Void)!

    @IBOutlet weak var leagueNameLabel: UILabel!
    
    @IBOutlet weak var imageLeague: UIImageView!
    @IBOutlet weak var myView: UIView!
    
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
