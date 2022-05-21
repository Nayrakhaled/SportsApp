//
//  EventsViewController.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/15/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit
import CoreData
class EventsViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate {
  
    @IBOutlet var eventssTable: UITableView!
    
     var league  = League()
       let id = "4328"
       let sportName = "Soccer"
       let sportCountry = "England"
    
    //context CoreData
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        //register All cells
        
        eventssTable.register(TeamsTableViewCell.nib(), forCellReuseIdentifier: TeamsTableViewCell.ident)
        eventssTable.register(ComingEventsTableViewCell.nib(), forCellReuseIdentifier: ComingEventsTableViewCell.ident)
        eventssTable.register(LatestEventsTableViewCell.nib(), forCellReuseIdentifier: LatestEventsTableViewCell.ident)


        eventssTable.dataSource = self
        eventssTable.delegate = self
        // Do any additional setup after loading the view.
       
      //  let Fav = FavouriteLeague(context:context)
     //   print("league name : \(league.strLeague)")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         var rowCount = 0
                if section == 0 {
                    rowCount = 1
                    
                    
                }
                if section == 1 {
                    rowCount = 1
                }
               if section == 2 {
                    rowCount = 1
        }
              
                return rowCount
     }
    

  
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamsTableViewCell.ident) as! TeamsTableViewCell
        let cellTow = tableView.dequeueReusableCell(withIdentifier: ComingEventsTableViewCell.ident) as!
        ComingEventsTableViewCell
        let cellThree = tableView.dequeueReusableCell(withIdentifier: LatestEventsTableViewCell.ident) as!
        LatestEventsTableViewCell
        
        
        
        cell.layer.shadowColor = UIColor.black.cgColor
               cell.layer.shadowOffset = CGSize(width: 3, height: 3)
               cell.layer.shadowRadius = 4
               cell.layer.shadowOpacity = 0.3
               cell.layer.masksToBounds = false
        
        
        
       
        
        cellThree.layer.shadowColor = UIColor.black.cgColor
        cellThree.layer.shadowOffset = CGSize(width: 3, height: 3)
        cellThree.layer.shadowRadius = 4
        cellThree.layer.shadowOpacity = 0.3
        cellThree.layer.masksToBounds = false
        
        // data
             
              cellThree.leagueId(id:league.idLeague ?? "k" )
              cellTow.leagueId(id:league.idLeague ?? "")
              cell.SportNameAndSportCountry(sportName: league.strSport ?? "" , sportContury: league.strCountry ?? "" )
       
        switch indexPath.section {
               case 0:
              
                

                   return cellTow
               case 1:
              

                   return cellThree
            
               case 2:
                     
       
                
                if Constants.checkConnection() != true{
                  cell.didSelectRow = { data in
             
            
            let detailVC = self.storyboard?.instantiateViewController(withIdentifier:"teamVc") as! TeamDetailesViewController
                       
                       detailVC.modalPresentationStyle = .fullScreen
                       self.present(detailVC, animated: true, completion:nil)
            detailVC.setTeamDetailes(team: data)
                    }}else{
                    self.ShowAlert()
                }
                     return cell
               default:
                   return cell
               }
     }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
               case 0:
                   return 350
               case 1:
                   return 500
               case 2:
                   return 500
               default:
                   return 500
               }
        
    
        
        
    }
    
    func ShowAlert(){
        let alert = UIAlertController(title: "No Internt Connection", message: "You cann't open TeamsScreen without internet.", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }
  

   @IBAction func favBtn(_ sender: Any) {
    
    let coreData = CoreDataManger(context: context)
         
          coreData.addLeague(leauge: league.strLeague ?? "", youtube: league.strYoutube ?? "", padge: league.strBadge ?? "",id: league.idLeague ?? "",country: league.strCountry ?? "",strSport : league.strSport ?? "")
   }
   
   @IBAction func backBtn(_ sender: Any) {
       dismiss(animated: true, completion: nil)
   }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
}


