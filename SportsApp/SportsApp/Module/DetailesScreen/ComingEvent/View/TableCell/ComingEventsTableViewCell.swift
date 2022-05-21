//
//  ComingEventsTableViewCell.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/14/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit

class ComingEventsTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout,ComingTableViewCell {
    func showIndicator() {
        print("showIndect")
    }
    
    func hideIndicator() {
        print("hideIndicatoe")
    }
    
    func fetchingDataSuccess() {
        collection.reloadData()
    }
    
    func showError() {
        print("showerror")
    }
    
   
    static let  ident = "coming"
      static func nib() -> UINib {
          return UINib(nibName: "ComingEventsTableViewCell", bundle: nil)
      }
  
    @IBOutlet var collection: UICollectionView!
    @IBOutlet var tableLabel: UILabel!
  
    //presenter
    var prenenter :ComingVCPresenter!
    
    
    //id
         
     var id :String?
    override func awakeFromNib() {
        super.awakeFromNib()
       
        collection.delegate = self
        collection.dataSource = self
        collection.register(ComingEventsCollectionViewCell.nib(), forCellWithReuseIdentifier: ComingEventsCollectionViewCell.ident)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
         //presenter
               prenenter = ComingVCPresenter (service: NetworkManager())
               prenenter.attachView(view: self)
     
    }
    
    func leagueId (id :String){
              self.id = id
              prenenter.getUpcomingEvent(url: Constants.LatestEvent, leaugeId:id)

          }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        prenenter.getUpComingEvents()       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComingEventsCollectionViewCell.ident, for: indexPath) as! ComingEventsCollectionViewCell
        
          prenenter.configure(cell: cell, index: indexPath.row)
      
        return cell
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return CGSize(width: 400, height: 250)
    }
}

    

