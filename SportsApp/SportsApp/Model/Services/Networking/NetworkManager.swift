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
    
    func loadData<T: Decodable>(url: String, param: [String: String], responseType: T.Type, complitionHandler: @escaping (T?,Error?)->Void){
        
        AF.request(Constants.BASE_URL + url, method: .get, parameters: param ).responseDecodable(of: T.self){ (response) in
            print("Response: \(response)")
            
            let result = response.result
            print("Result\(response.result)")
            switch result{
            case .success(let res):
                
                complitionHandler(res, nil)
                
            case .failure(let error):
                
                complitionHandler(nil, error)
            }
        }
        
    }

}
