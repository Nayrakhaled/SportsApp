//
//  NetworkServicesTow.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/15/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation


//NetworkServicesTow

import Alamofire

class TodosInteractor {
    
    var baseUrl = ""
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getTodos(endPoint: String, completionHandler: @escaping ([Todo]?, Error?) -> ()) {
        
        AF.request(self.baseUrl + endPoint, method: .get).responseDecodable(of: [Todo].self) { (response) in
            print("result: \(response)")
            
            let result = response.result
            switch result {
            case .success(let todos):
                print("Result SUCCESS")
                completionHandler(todos, nil)
            case .failure(let error):
                print("Result FAILED")
                completionHandler(nil, error)
            }
            
        }
    }
}
