//
//  AMSVideoIndexesResponseModel.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct AMSVideoIndexesResponseModel: Decodable {
    let summarizedInsights: AMSSummarizedInsights
    
    enum CodingKeys: String, CodingKey {
        case summarizedInsights
    }
}
