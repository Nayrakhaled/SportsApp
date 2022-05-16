//
//  NetworkManagerProtocol.swift
//  SportsApp
//
//  Created by NayraKhaled on 5/12/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation

protocol NetworkManagerProtocol {
    
    
     func loadData<T: Decodable>(url: String, param: [String: String],responseType: T.Type, complitionHandler: @escaping (T?,Error?)->Void)
    
}
