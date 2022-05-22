//
//  LeaguesViewController.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/13/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit


protocol LeaguesProtocol : AnyObject{
    func stopAnimating()
    func renderTableView(league: [League])
}

class LeaguesViewController: UIViewController {

    
    var leagues = [League]()
    var sportName: String?
    let indicator = UIActivityIndicatorView(style: .large)
    var presenter : LeaguesPresenterProtocol!
    
    @IBOutlet weak var leaguesTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        self.leaguesTableView.delegate = self
        self.leaguesTableView.dataSource = self
        self.leaguesTableView.register(UINib(nibName: "LeaguesTableViewCell", bundle: nil), forCellReuseIdentifier: "cellLeagues")
        
        presenter = LeaguesPresenter(NWService: NetworkManager())
               
        presenter.attachView(view: self)
        
        
                     
        if Constants.flag == true {
             presenter.getLeagues(url: Constants.ALLLEAGUES, sportName: sportName!)
        }else{
            ShowAlert()
        }
        
    }
    
}


extension LeaguesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = leaguesTableView.dequeueReusableCell(withIdentifier: "cellLeagues", for: indexPath) as! LeaguesTableViewCell
        
            
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 3, height: 3)
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 0.3
        cell.layer.masksToBounds = false
        
        cell.leagueNameLabel.text =  leagues[indexPath.row].strLeague!
        
        cell.imageLeague.kf.setImage(with: URL(string: leagues[indexPath.row].strBadge!), placeholder: UIImage(named: "car.png"))
        
        cell.myView.layer.cornerRadius = cell.imageLeague.frame.height/3
        cell.myView.layer.borderColor = UIColor.black.cgColor
        
        cell.imageLeague.layer.borderWidth = 1
        cell.imageLeague.layer.masksToBounds = false
        cell.imageLeague.layer.borderColor = UIColor.black.cgColor
        cell.imageLeague.layer.cornerRadius = cell.imageLeague.frame.height/2
        cell.imageLeague.clipsToBounds = true
        
        cell.goToYoutube = {
            if Constants.flag == true{
                let youTubeURl = URL(string: "https://" +  self.leagues[indexPath.row].strYoutube!)
        
                if UIApplication.shared.canOpenURL(youTubeURl!) {
                    UIApplication.shared.open(youTubeURl!)
                }
            }else{
                self.ShowAlert()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if Constants.flag == true{
           let detailVC = storyboard?.instantiateViewController(withIdentifier: "event") as! EventsViewController
            detailVC.league = leagues[indexPath.row]
            detailVC.modalPresentationStyle = .fullScreen
            present(detailVC, animated: true, completion:nil)
            print("HERE.....")
            }else{
                self.ShowAlert()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       // return UIScreen.main.bounds.height/10
        return 120
    }
    
    func ShowAlert(){
        let alert = UIAlertController(title: "No Internt Connection", message: "You cann't open youtube without internet.", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension LeaguesViewController : LeaguesProtocol {
    func renderTableView(league: [League]) {
        self.leagues = league
        self.leaguesTableView.reloadData()
    }

    func stopAnimating() {
        indicator.stopAnimating()
        
    }
}
