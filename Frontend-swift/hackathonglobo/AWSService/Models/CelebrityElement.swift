//
//  CelebrityElement.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 20/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct CelebrityElement: Decodable {
    let celebrity: Celebrity
    let timestamp: Int
    
    enum CodingKeys: String, CodingKey {
        case celebrity = "Celebrity"
        case timestamp = "Timestamp"
    }
    
    
}
