//
//  QuakesTests.swift
//  QuakesTests
//
//  Created by Paul Solt on 10/31/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import XCTest
@testable import Quakes

class QuakesTests: XCTestCase {

 
    func testQuake() {
      
        
        //Red, Green, Refractor
        // Red = Failing Test, green = Passing, Refractror = Clean Up/ Organize
        
       // let quake = Quake()
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let date = Date(timeIntervalSince1970: 1388620296020)
        
        
        
        do {
            let quake = try decoder.decode(Quake.self, from: quakeData)
            //Asset(Expected, Actual)
          //  XCTAssertEqual(1.29, quake.magnitude) 1.29 == 1.28888889 FAILS!
            
            XCTAssertEqual(1.29, quake.magnitude, accuracy: 0.001)
            XCTAssertEqual("10km SSW of Idyllwild, CA", quake.place)
            XCTAssertEqual(date, quake.time)
            XCTAssertEqual(-116.7776667, quake.longitude, accuracy: 0.001)
            XCTAssertEqual(33.663333299999998, quake.latitude, accuracy: 0.001)
        } catch {
            XCTFail("Error decoding \(error) ")
        }
        
    }
    
    

}
