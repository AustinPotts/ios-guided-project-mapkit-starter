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
        
        do {
            let quake = try decoder.decode(Quake.self, from: quakeData)
            //Asset(Expected, Actual)
          //  XCTAssertEqual(1.29, quake.magnitude) 1.29 == 1.28888889 FAILS!
            
            XCTAssertEqual(1.29, quake.magnitude, accuracy: 0.001)
        } catch {
            XCTFail("Error decoding \(error) ")
        }
        
    }
    
    

}
