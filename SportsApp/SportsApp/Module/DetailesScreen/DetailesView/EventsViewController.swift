//
//  EventsViewController.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/15/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate {
 

    
    
  
    @IBOutlet var eventssTable: UITableView!
    
    var model = [Model]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        eventssTable.register(TeamsTableViewCell.nib(), forCellReuseIdentifier: TeamsTableViewCell.ident)
        eventssTable.register(ComingEventsTableViewCell.nib(), forCellReuseIdentifier: ComingEventsTableViewCell.ident)
        eventssTable.register(LatestEventsTableViewCell.nib(), forCellReuseIdentifier: LatestEventsTableViewCell.ident)


        eventssTable.dataSource = self
        eventssTable.delegate = self
        // Do any additional setup after loading the view.
       
        model.append(Model(name: "aya"))
        model.append(Model(name: "aya"))
        

        
        
        
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
        
        
        
        //
        cell.configure(model: model)
        //
        switch indexPath.section {
               case 0:
                 //  cell.ayaa = ayaList[0]
                //cellTow.configure(model: model)
                         

                   return cellTow
               case 1:
               //  cellThree.configure()

                   return cellThree
            
               case 2:
                     
                     // cell.configure(model: model)

                     return cell
               default:
                   return cell
               }
        
        
        return cell
        
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
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
struct Model {
      var name : String!
      init(name :String) {
          self.name = name
      }
  }

