//
//  ViewController.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/11/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit
import Kingfisher


protocol HomeProtocol : AnyObject{
    func stopAnimating()
    func renderCollectionView(sport: [Sport])
}

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout{
    
    let indecator = UIActivityIndicatorView(style: .large)
    var presenter : HomePresenterProtocol!
    var sport = [Sport]()
    let layout = UICollectionViewFlowLayout()

    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Constants.checkConnection()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right:0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 4)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.homeCollectionView.collectionViewLayout = layout
       
        indecator.center = self.view.center
        self.view.addSubview(indecator)
        
        self.homeCollectionView.delegate = self
        self.homeCollectionView.dataSource = self
        
        presenter = HomePresenter(NWService: NetworkManager())
        
        presenter.attachView(view: self)
     
        
        if Constants.flag == true{
            print("internet")
            indecator.startAnimating()
            presenter.getHomeSports(url:  Constants.ALLSPORTS)
        }else{
            ShowAlert()
            print("No internet")
        }
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sport.count
     }
    
       
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellHome", for: indexPath) as! HomeCollectionViewCell
        
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        
        cell.myView.layer.cornerRadius = cell.imageHome.frame.height/3
        cell.myView.layer.borderColor = UIColor.black.cgColor
        
        cell.setImageHome(url: sport[indexPath.row].strSportThumb!)
        cell.setSportName(name: sport[indexPath.row].strSport!)
         return cell
     }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let LeagueVC = storyboard?.instantiateViewController(withIdentifier: "league") as! LeaguesViewController
               
        LeagueVC.sportName = sport[indexPath.row].strSport
    navigationController?.pushViewController(LeagueVC, animated: true)
//        LeagueVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
//
//        present(LeagueVC, animated: true, completion:nil)
    }
}
extension ViewController : HomeProtocol {
    func renderCollectionView(sport: [Sport]) {
        self.sport = sport
        self.homeCollectionView.reloadData()
    }
    
    func stopAnimating() {
        indecator.stopAnimating()
    }
    
    func ShowAlert(){
              let alert = UIAlertController(title: "No Internt Connection", message: "You cann't open youtube without internet.", preferredStyle: .alert)
              let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
              alert.addAction(okBtn)
              self.present(alert, animated: true, completion: nil)
          }
    
}
