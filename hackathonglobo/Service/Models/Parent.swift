//
//  Parent.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 20/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct Parent: Codable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
    }
}


