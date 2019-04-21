//
//  Celebrity.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 20/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct Celebrity: Decodable {
    
    let confidence: Double
    let id: String
    let name: String
    let urls: [String]
    
    enum CodingKeys: String, CodingKey {
        case confidence = "Confidence"
        case id = "Id"
        case name = "Name"
        case urls = "Urls"
    }
}
