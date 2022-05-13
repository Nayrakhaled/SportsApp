//
//  SportsAppTests.swift
//  SportsAppTests
//
//  Created by NayraKhaled on 5/11/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import XCTest
@testable import SportsApp

class SportsAppTests: XCTestCase {
    
    let networkManager: NetworkManagerProtocol = NetworkManager()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetAllSports(){
        let expectaion = expectation(description: "Waiting All Sports")
        networkManager.getAllSports(url: Constants.BASE_URL + Constants.ALLSPORTS) { (sports, error) in
                   guard let sports = sports else{
                       XCTFail()
                       expectaion.fulfill()
                       return
                   }
                XCTAssertEqual(sports.count, 34, "API Faild")
                   expectaion.fulfill()
               }
               waitForExpectations(timeout: 5, handler: nil)
           }

    func testGetAllLeagues(){
    let expectaion = expectation(description: "Waiting All Leagues of Spport")
    networkManager.getAllLeagues(url: Constants.BASE_URL + Constants.ALLLEAGUES + "Soccer") { (leagues, error) in
               guard let leagues = leagues else{
                   XCTFail()
                   expectaion.fulfill()
                   return
               }
            XCTAssertEqual(leagues.count, 10, "API Faild")
               expectaion.fulfill()
           }
           waitForExpectations(timeout: 5, handler: nil)
       }
    

}
