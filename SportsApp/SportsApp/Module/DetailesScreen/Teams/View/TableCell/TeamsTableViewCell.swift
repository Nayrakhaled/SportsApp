//
//  TeamsTableViewCell.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/14/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit

class TeamsTableViewCell:UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout ,TeamsViewCell{
  
    
    //xib table cell
    static let  ident = "teamTableCell"
    static func nib() -> UINib {
        return UINib(nibName: "TeamsTableViewCell", bundle: nil)
    }
    
    //presenter 
    var present :TeamsVCPresenter!
    
    @IBOutlet var teamCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //tablecell
        teamCollection.delegate = self
        teamCollection.dataSource = self
        
        //register the collection cell
        teamCollection.register(TeamsCollectionViewCell.nib(), forCellWithReuseIdentifier: TeamsCollectionViewCell.ident)
        
        //presenter
        present = TeamsVCPresenter(service: NetworkManager())
        present.attachView(view: self)
        present.getAllTeams(url: Constants.AllTeams, sportName: "Soccer", sportContury:"England")
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //collection functions
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return present.getTeamCount()
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamsCollectionViewCell.ident, for: indexPath) as! TeamsCollectionViewCell
        
        present.configure(cell: cell, index: indexPath.row)
        
        cell.layer.shadowColor = UIColor.black.cgColor
                      cell.layer.shadowOffset = CGSize(width: 3, height: 3)
                      cell.layer.shadowRadius = 4
                      cell.layer.shadowOpacity = 0.3
                      cell.layer.masksToBounds = false
               
        return cell
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
    
    
    
    //presnter functions
    
    func showIndicator() {
          print("showIndicator")
      }
      
      func hideIndicator() {
          print("hideIndicator")
      }
      
      func fetchingDataSuccess() {
          teamCollection.reloadData()
      }
      
      func showError() {
          print("showError")
      }
    
}
