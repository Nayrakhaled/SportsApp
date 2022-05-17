//
//  LatestEventsTableViewCell.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/14/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit

class LatestEventsTableViewCell: UITableViewCell ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,LatestViewCell {
 

    
    @IBOutlet var latestTitleCell: UILabel!
    @IBOutlet var latestCollection: UICollectionView!
    
    
    //xib table cell
      static let  ident = "latestTableCell"
         static func nib() -> UINib {
             return UINib(nibName: "LatestEventsTableViewCell", bundle: nil)
         }
      //presenter
      var prenenter :LatestVCPresenter!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //collection delegate
        latestCollection.delegate = self
        latestCollection.dataSource = self
        
        //collection cell register
        
        latestCollection.register(LatestEventsCollectionViewCell.nib(), forCellWithReuseIdentifier: LatestEventsCollectionViewCell.ident)
        
        //presenter 
        prenenter = LatestVCPresenter (service: NetworkManager())
        prenenter.attachView(view: self)
        prenenter.getLastestEvents(url: Constants.LatestEvent, leaugeId:"4328")
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //collection functions
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return prenenter.getLatestEventsCount()
         }
         
         func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestEventsCollectionViewCell.ident, for: indexPath) as! LatestEventsCollectionViewCell
          
            prenenter.configure(cell: cell, index: indexPath.row)
            
            cell.layer.shadowColor = UIColor.black.cgColor
                          cell.layer.shadowOffset = CGSize(width: 3, height: 3)
                          cell.layer.shadowRadius = 4
                          cell.layer.shadowOpacity = 0.3
                          cell.layer.masksToBounds = false
                   
          return cell
         }
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 500, height: 200)
      }
    
    
    
    //presenter function
    
    func showIndicator() {
         print("start indictor")
     }
     
     func hideIndicator() {
         print("hideIndecator")
     }
     
     func fetchingDataSuccess() {
         print("data done")
         latestCollection.reloadData()
         
     }
     
     func showError() {
         print ("error")
     }
     
    
}
