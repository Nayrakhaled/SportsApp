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
        
        presenter = LeaguesPresenter(NWService: NetworkManager())
               
        presenter.attachView(view: self)
                     
        presenter.getLeagues(url: Constants.BASE_URL + Constants.ALLLEAGUES + sportName!)
        
    }
    
}


extension LeaguesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = leaguesTableView.dequeueReusableCell(withIdentifier: "cellLeagues", for: indexPath) as! LeaguesTableViewCell
        
            
        cell.labelLeagueName.text =  leagues[indexPath.row].strLeague!

        cell.imageLeague.layer.cornerRadius = cell.frame.height / 2
        
        cell.imageLeague.kf.setImage(with: URL(string: leagues[indexPath.row].strBadge!), placeholder: UIImage(named: "car.png"))

            return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
