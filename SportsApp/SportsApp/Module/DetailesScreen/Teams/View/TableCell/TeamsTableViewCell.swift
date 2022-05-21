//
//  TeamsTableViewCell.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/14/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit

class TeamsTableViewCell:UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout ,TeamsViewCell{
    
    
    
    
    var didSelectRow: ((_ data: Team) -> Void)? = nil // Closure
       
    var arrData = [Team]()
     
    func configTableCell(Team: [Team]) {
        arrData = Team
        teamCollection.reloadData()
    }
    
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
        
        present = TeamsVCPresenter(service: NetworkManager())
        present.attachView(view: self)
        
    }
    
    func SportNameAndSportCountry (sportName: String, sportContury:String){
           present.getAllTeams(url: Constants.AllTeams, sportName: sportName, sportContury:sportContury)

       }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //collection functions
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamsCollectionViewCell.ident, for: indexPath) as! TeamsCollectionViewCell
        
        present.configure(cell: cell, index: indexPath.row)
        
        
               
        return cell
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          
          let data = self.arrData[indexPath.row]
                 didSelectRow?(data)      }
    
    
    //presnter functions
    
    func showIndicator() {
          print("showIndicator")
      }
      
      func hideIndicator() {
          print("hideIndicator")
      }
      
      func fetchingDataSuccess() {
         // teamCollection.reloadData()
      }
      
      func showError() {
          print("showError")
      }
    
}
