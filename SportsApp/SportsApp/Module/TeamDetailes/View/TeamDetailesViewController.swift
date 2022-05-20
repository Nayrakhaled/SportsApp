//
//  TeamDetailesViewController.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/19/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit
import Kingfisher

class TeamDetailesViewController: UIViewController {

    
    @IBOutlet var backGroundImage: UIImageView!
    
    
    @IBOutlet var teamNameImage: UILabel!
    
    
    @IBOutlet var teamImage: UIImageView!
    

    
    
    @IBOutlet var leagueLabel: UILabel!
    
    @IBOutlet var leagueContent: UILabel!
    
    @IBOutlet var stadiumContent: UILabel!
    
    @IBOutlet var CountryLabel: UILabel!
    
    @IBOutlet var TshirtImage: UIImageView!
    
    @IBOutlet var teamsName: UILabel!
    var teamDetailes = Team()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    func setTeamDetailes (team :Team){
        teamDetailes = team
        backGroundImage.kf.setImage(with: URL(string:teamDetailes.strStadiumThumb ?? ""), placeholder: UIImage(named: "car.png"))
        teamImage.kf.setImage(with: URL(string:teamDetailes.strTeamBadge ?? ""), placeholder: UIImage(named: "chelsea"))
        CountryLabel.text = teamDetailes.strCountry
        leagueContent.text = teamDetailes.strLeague
        stadiumContent.text = teamDetailes.strStadium
        teamsName.text = teamDetailes.strTeam
        TshirtImage.kf.setImage(with: URL(string:teamDetailes.strTeamJersey ?? ""), placeholder: UIImage(named: "chelsea"))
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func FaceBtn(_ sender: UIButton) {
        
        if Constants.checkConnection() != true{
                      let youTubeURl = URL(string: "https://" +  self.teamDetailes.strFacebook!)
              
                      if UIApplication.shared.canOpenURL(youTubeURl!) {
                          UIApplication.shared.open(youTubeURl!)
                      }
                  }else{
                      self.ShowAlert()
                  }
    }
    
    
    @IBAction func tweitterBtn(_ sender: UIButton) {
        if Constants.checkConnection() != true{
            let youTubeURl = URL(string: "https://" +  (self.teamDetailes.strTwitter ?? "" ))
              
                      if UIApplication.shared.canOpenURL(youTubeURl!) {
                          UIApplication.shared.open(youTubeURl!)
                      }
                  }else{
                      self.ShowAlert()
                  }
    }
    
    
    @IBAction func instgramBtn(_ sender: Any) {
        if Constants.checkConnection() != true{
            let youTubeURl = URL(string: "https://" +  self.teamDetailes.strInstagram!)
              
                      if UIApplication.shared.canOpenURL(youTubeURl!) {
                          UIApplication.shared.open(youTubeURl!)
                      }
                  }else{
                      self.ShowAlert()
                  }
        
    }
    @IBAction func webBtn(_ sender: Any) {
    }
    
    func ShowAlert(){
        let alert = UIAlertController(title: "No Internt Connection", message: "You cann't open TeamsScreen without internet.", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }
}

