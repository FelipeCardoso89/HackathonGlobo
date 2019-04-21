//
//  AzureVideoIndexesServiceManager.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

class AzureVideoIndexesServiceManager {
    
    static let shared = AzureVideoIndexesServiceManager()
    
    func performVideoAnalyses(for data: Data, completion: ((AMSVideoIndexesResponseModel?, NSError?) -> Void)) {
        if let response: AMSVideoIndexesResponseModel = try? JSONDecoder().decode(AMSVideoIndexesResponseModel.self, from: data) {
            completion(response, nil)
        } else {
            completion(nil, NSError(domain: "hackathonglobo2019", code: 001, userInfo: ["message": "Can't load data"]))
        }
    }
}
