//
//  TeamsTableViewCell.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/14/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit

class TeamsTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout ,TeamsViewCell{
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
    

    static let  ident = "teamTableCell"
    static func nib() -> UINib {
        return UINib(nibName: "TeamsTableViewCell", bundle: nil)
    }
    var models = [Model]()
    
    var present :TeamsVCPresenter!
    @IBOutlet var teamCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        teamCollection.delegate = self
        teamCollection.dataSource = self
        teamCollection.register(TeamsCollectionViewCell.nib(), forCellWithReuseIdentifier: TeamsCollectionViewCell.ident)
        present = TeamsVCPresenter(view: self)
        present.viewDidLoad()
    }
    
    func configure (model:[Model]){
        self.models = model
        teamCollection.reloadData()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return present.getTeamCount()
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamsCollectionViewCell.ident, for: indexPath) as! TeamsCollectionViewCell
        
        present.configure(cell: cell, index: indexPath.row)
        return cell
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
    
}
