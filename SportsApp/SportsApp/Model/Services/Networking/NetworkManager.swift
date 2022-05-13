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
    func getHome(url: String, complitionHandler: @escaping ([Sport]?,Error?)->Void){
        
        AF.request(Constants.BASE_URL + Constants.ALLSPORTS, method: .get).responseDecodable(of: [Sport].self){ (response) in
            print("Response: \(response)")
            
            let result = response.result
            switch result{
            case .success(let sports):
                print("Sueess")
                complitionHandler(sports, nil)
            case .failure(let error):
                print("Fail")
                complitionHandler(nil, error)
            }
        }
        
    }
}


