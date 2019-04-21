//
//  Label.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 20/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct Label: Codable {
    let confidence: Double
    let name: String
    let parents: [Parent]
    
    enum CodingKeys: String, CodingKey {
        case confidence = "Confidence"
        case name = "Name"
        case parents = "Parents"
    }
    
}
