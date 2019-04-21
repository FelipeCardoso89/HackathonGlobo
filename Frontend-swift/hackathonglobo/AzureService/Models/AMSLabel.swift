//
//  AMSLabel.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct AMSLabel: Codable {
    let id: Int
    let name: String
    let appearances: [AMSAppearance]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case appearances
    }
}
