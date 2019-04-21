//
//  Sentiment.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct AMSSentiment: Codable {
    
    let sentimentKey: String
    let seenDurationRatio: Double
    let appearances: [AMSAppearance]
    
    enum CodingKeys: String, CodingKey {
        case sentimentKey
        case seenDurationRatio
        case appearances
    }
    
    
}
