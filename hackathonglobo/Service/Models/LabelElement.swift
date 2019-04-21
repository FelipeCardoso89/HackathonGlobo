//
//  LabelElement.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 20/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct LabelElement: Codable {
    let label: Label
    let timestamp: Int
    
    enum CodingKeys: String, CodingKey {
        case label = "Label"
        case timestamp = "Timestamp"
    }
    
    init(label: Label, timestamp: Int) {
        self.label = label
        self.timestamp = timestamp
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let label = try values.decode(Label.self, forKey: .label)
        let timestamp = try values.decode(Int.self, forKey: .timestamp)
        self.init(label: label, timestamp: timestamp)
    }
}
