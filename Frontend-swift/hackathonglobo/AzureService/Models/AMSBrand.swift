//
//  AMSBrand.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct AMSBrand: Codable {
    let id: Int
    let referenceId: String
    let referenceUrl: String
    let confidence: Double
    let description: String
    let seenDuration: Double
    let name: String
    let appearances: [AMSAppearance]
    
    enum CodingKeys: String, CodingKey {
        case id
        case referenceId
        case referenceUrl
        case confidence
        case description
        case seenDuration
        case name
        case appearances
    }
    
    init(id: Int, referenceId: String, referenceUrl: String, confidence: Double, description: String, seenDuration: Double, name: String, appearances: [AMSAppearance]) {
        self.id = id
        self.referenceId = referenceId
        self.referenceUrl = referenceUrl
        self.confidence = confidence
        self.description = description
        self.seenDuration = seenDuration
        self.name = name
        self.appearances = appearances
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let id = try values.decode(Int.self, forKey: .id)
        let referenceId = try values.decode(String.self, forKey: .referenceId)
        let referenceUrl = try values.decode(String.self, forKey: .referenceUrl)
        let confidence = try values.decode(Double.self, forKey: .confidence)
        let description = try values.decode(String.self, forKey: .description)
        let seenDuration = try values.decode(Double.self, forKey: .seenDuration)
        let name = try values.decode(String.self, forKey: .name)
        let appearances = try values.decode([AMSAppearance].self, forKey: .appearances)
        
        self.init(
            id: id,
            referenceId: referenceId,
            referenceUrl: referenceUrl,
            confidence: confidence,
            description: description,
            seenDuration: seenDuration,
            name:  name,
            appearances: appearances
        )
    }
    
}
