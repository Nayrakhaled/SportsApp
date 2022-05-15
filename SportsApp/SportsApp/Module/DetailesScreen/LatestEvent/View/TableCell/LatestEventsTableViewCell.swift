//
//  LatestEventsTableViewCell.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/14/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit

class LatestEventsTableViewCell: UITableViewCell ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,TodosViewCell {
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
    
    
    // coleection ident latestCollectionCell
    
    static let  ident = "latestTableCell"
       static func nib() -> UINib {
           return UINib(nibName: "LatestEventsTableViewCell", bundle: nil)
       }
       var models = [Model]()
    var prenenter :TodosVCPresenter!
    @IBOutlet var latestTitleCell: UILabel!
    @IBOutlet var latestCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        latestCollection.delegate = self
        latestCollection.dataSource = self
        latestCollection.register(LatestEventsCollectionViewCell.nib(), forCellWithReuseIdentifier: LatestEventsCollectionViewCell.ident)
        prenenter = TodosVCPresenter(view: self)
        prenenter.viewDidLoad()
    }

    
    func configure (){
        //  self.models = model
        print("reload collection")

          //latestCollection.reloadData()
        print("reload collection")
          
      }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return prenenter.getTodosCount()
         }
         
         func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestEventsCollectionViewCell.ident, for: indexPath) as! LatestEventsCollectionViewCell
          
            prenenter.configure(cell: cell, index: indexPath.row)
          return cell
         }
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 500, height: 90)
      }
    
}
