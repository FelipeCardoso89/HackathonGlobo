//
//  ModerationLabelElement.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 20/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

class ModerationLabelElement: Decodable {
   
    let label: ModerationLabel
    let timestamp: Int
    
    enum CodingKeys: String, CodingKey {
        case label = "ModerationLabel"
        case timestamp = "Timestamp"
    }
    
    init(label: ModerationLabel, timestamp: Int) {
        self.label = label
        self.timestamp = timestamp
    }
    
    required convenience init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let label = try values.decode(ModerationLabel.self, forKey: .label)
        let timestamp = try values.decode(Int.self, forKey: .timestamp)
        self.init(label: label, timestamp: timestamp)
    }
    
}
