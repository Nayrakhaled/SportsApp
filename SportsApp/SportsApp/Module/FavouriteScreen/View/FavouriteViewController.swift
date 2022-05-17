//
//  FavouriteViewController.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/16/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit
import CoreData

protocol FavLeagueProtocol {
    func renderTableView(league: [League])
}

class FavouriteViewController: UIViewController {
    
    var leagues = [League]()
    var presenter : FavLeaguePresenterProtocol!


    @IBOutlet weak var favTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.favTableView.delegate = self
        self.favTableView.dataSource = self
        
        self.favTableView.register(UINib(nibName: "FavouriteTableViewCell", bundle: nil), forCellReuseIdentifier: "cellFavourite")
        
        presenter = FavLeaguePresenter(db: DBManager())
        presenter.attachView(view: self)
        presenter.getFavLeague()
    }
}

extension FavouriteViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return UIScreen.main.bounds.height/10
       }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favTableView.dequeueReusableCell(withIdentifier: "cellFavourite", for: indexPath) as! FavouriteTableViewCell
        
            
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 3, height: 3)
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 0.3
        cell.layer.masksToBounds = false
        
        
        cell.nameLeagueLabel.text =  leagues[indexPath.row].strLeague!
               
        cell.imageFavLeague.kf.setImage(with: URL(string: leagues[indexPath.row].strBadge!), placeholder: UIImage(named: ""))
               
        cell.goToYoutube = {
            if Constants.checkConnection() != true{
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if Constants.checkConnection() != true{
            let detailVC = storyboard?.instantiateViewController(withIdentifier: "event") as! EventsViewController
            //detailVC.league = leagues[indexPath.row]
            detailVC.modalPresentationStyle = .fullScreen
            present(detailVC, animated: true, completion:nil)
        }else{
            self.ShowAlert()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        presenter.deleteFavLeague(position: indexPath.row)
        leagues.remove(at: indexPath.row)
        favTableView.deleteRows(at: [indexPath], with: .automatic)
        favTableView.reloadData()
    }
    
    func ShowAlert(){
           let alert = UIAlertController(title: "No Internt Connection", message: "You cann't open youtube without internet.", preferredStyle: .alert)
           let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
           alert.addAction(okBtn)
           self.present(alert, animated: true, completion: nil)
       }
}


extension FavouriteViewController : FavLeagueProtocol {
    func renderTableView(league: [League]) {
        self.leagues = league
        self.favTableView.reloadData()
    }
    
}
