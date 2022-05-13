//
//  ViewController.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/11/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 3
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellHome", for: indexPath) as! HomeCollectionViewCell
        
        
         return cell
     }
    
}
