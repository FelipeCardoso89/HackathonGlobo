//
//  SummarizedInsights.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct AMSSummarizedInsights: Codable {
    let sentiments: [AMSSentiment]
    let labels: [AMSLabel]
    let brands: [AMSBrand]
    
    enum CodingKeys: String, CodingKey {
        case sentiments
        case labels
        case brands
    }
}
