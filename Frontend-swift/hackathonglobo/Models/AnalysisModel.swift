//
//  AnalysisModel.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct AnalysisModel: Codable {
    
    let mood: [String]
    let tags: [String]
    let celebridade: String
    
    enum CondingKeys: String, CodingKey {
        case mood
        case tags
        case celebridade
    }
}
