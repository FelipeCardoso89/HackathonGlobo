//
//  Appearance.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct AMSAppearance: Codable {
    
    let startTime: String
    let endTime: String
    let startSeconds: Double
    let endSeconds: Double
    
    enum CodingKeys: String, CodingKey {
        case startTime
        case endTime
        case startSeconds
        case endSeconds
    }
}
