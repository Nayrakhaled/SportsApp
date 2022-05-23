//
//  FavouriteViewController.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/16/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit
import CoreData

class FavouriteViewController: UIViewController {
    
    var leagues = [League]()
    var leaguesFav = [SavingLeague]()
    var presenter : FavLeaguePresenterProtocol!

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var favTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.favTableView.delegate = self
        self.favTableView.dataSource = self
        self.favTableView.register(UINib(nibName: "FavouriteTableViewCell", bundle: nil), forCellReuseIdentifier: "cellFavourite")
        
     presenter = FavLeaguePresenter(db: CoreDataManger(context: context))
    }
    
    override func viewWillAppear(_ animated: Bool) {
            presenter.attachView(view: self)
            presenter.getFavLeague()
       }
}

extension FavouriteViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaguesFav.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         //  return UIScreen.main.bounds.height/10
        return 120
       }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favTableView.dequeueReusableCell(withIdentifier: "cellFavourite", for: indexPath) as! FavouriteTableViewCell
        
            
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 3, height: 3)
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 0.3
        cell.layer.masksToBounds = false
        
        cell.myView.layer.cornerRadius = cell.imageFavLeague.frame.height/3
        cell.myView.layer.borderColor = UIColor.black.cgColor
        
        cell.nameLeagueLabel.text =  leaguesFav[indexPath.row].league!
               
        cell.imageFavLeague.layer.borderWidth = 1
        cell.imageFavLeague.layer.masksToBounds = false
        cell.imageFavLeague.layer.borderColor = UIColor.black.cgColor
        cell.imageFavLeague.layer.cornerRadius = cell.imageFavLeague.frame.height/2
        cell.imageFavLeague.clipsToBounds = true
        
        cell.imageFavLeague.kf.setImage(with: URL(string: leaguesFav[indexPath.row].padge!), placeholder: UIImage(named: ""))
               
        cell.goToYoutube = {
            if Constants.flag == true{
                let youTubeURl = URL(string: "https://" +  self.leaguesFav[indexPath.row].youtube!)

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
         if Constants.flag == true{
            let detailVC = storyboard?.instantiateViewController(withIdentifier: "event") as! EventsViewController
            let leaguge = League()
            leaguge.idLeague = leaguesFav[indexPath.row].id
            leaguge.strCountry = leaguesFav[indexPath.row].country
            leaguge.strLeague = leaguesFav[indexPath.row].league
            leaguge.strBadge = leaguesFav[indexPath.row].padge
            leaguge.strYoutube = leaguesFav[indexPath.row].youtube
            leaguge.strSport = leaguesFav[indexPath.row].sportName
            detailVC.league = leaguge
            
            detailVC.modalPresentationStyle = .fullScreen
            present(detailVC, animated: true, completion:nil)
        }else{
            self.ShowAlert()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        presenter.deleteFavLeague(fav: leaguesFav[indexPath.row])
        leaguesFav.remove(at: indexPath.row)
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
    func renderTableView(fav: [SavingLeague]) {
        self.leaguesFav = fav
        self.favTableView.reloadData()
    }
    
    func renderTableView(league: [League]) {
        self.leagues = league
        self.favTableView.reloadData()
    }
    
}
