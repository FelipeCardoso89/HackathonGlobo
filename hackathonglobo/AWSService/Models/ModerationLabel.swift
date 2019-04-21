//
//  ModerationLabel.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 20/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation


struct ModerationLabel: Decodable {
    let confidence: Double
    let name: String
    let parentName: String
    
    enum CodingKeys: String, CodingKey {
        case confidence = "Confidence"
        case name = "Name"
        case parentName = "ParentName"
    }
    
    init(confidence: Double, name: String, parentName: String) {
        self.confidence = confidence
        self.name = name
        self.parentName = parentName
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let confidence = try values.decode(Double.self, forKey: .confidence)
        let name = try values.decode(String.self, forKey: .name)
        let parentName = try values.decode(String.self, forKey: .parentName)
        self.init(confidence: confidence, name: name, parentName: parentName)
    }
}
