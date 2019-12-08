//
//  QuakeClass.swift
//  Quakes
//
//  Created by Austin Potts on 12/8/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import Foundation


// MKAnnotation requires we subclass from NSObject
// Allows us to show data on a map

class Quake: NSObject, Decodable {
    
    let magnitude: Double
    
    enum QuakeCodingKeys: String, CodingKey {
        case magnitude = "mag"
        case properties
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: QuakeCodingKeys.self)
        
        let properties = try  container.nestedContainer(keyedBy: QuakeCodingKeys.self, forKey: .properties)
        
        self.magnitude = try properties.decode(Double.self, forKey: .magnitude)
        
        super.init()
    }
    
}
