//
//  NetworkManager.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/12/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager: NetworkManagerProtocol{
    func getAllSports(url: String, complitionHandler: @escaping ([Sport]?,Error?)->Void){
        
        AF.request(Constants.BASE_URL + Constants.ALLSPORTS, method: .get).responseDecodable(of: AllSports.self){ (response) in
            print("Response: \(response)")
            
            let result = response.result
            print("Result\(response.result)")
            switch result{
            case .success(let sports):
                
                print("Sucess.......")
                print("Sports...\(String(describing: sports.sports![0].strSport))")
                complitionHandler(sports.sports, nil)
                
            case .failure(let error):
                
                print("Fail......\(error.localizedDescription)")
                complitionHandler(nil, error)
            }
        }
        
    }
    
    func getAllLeagues(url: String, complitionHandler: @escaping ([League]?,Error?)->Void){
        AF.request(Constants.BASE_URL + Constants.ALLLEAGUES + "Soccer", method: .get).responseDecodable(of: AllLeagues.self){ (response) in
            print("Response: \(response)")
            
            let result = response.result
            print("Result\(response.result)")
            switch result{
            case .success(let leagues):
                
                print("Sucess.......")
                print("Sports...\(String(describing: leagues.countries![0].strBadge))")
                complitionHandler(leagues.countries, nil)
                
            case .failure(let error):
                
                print("Fail......\(error.localizedDescription)")
                complitionHandler(nil, error)
            }
        }
    }
    
   
    
    


}
