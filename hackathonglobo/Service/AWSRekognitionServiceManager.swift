//
//  AWSRekognitionServiceManager.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 20/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

class AWSRekognitionServiceManager {
    
    static let shared = AWSRekognitionServiceManager()
    
    func performVideoAnalyses(for data: Data, completion: ((AWSVideoRekognitionResponseModel?, NSError?) -> Void)) {
        if let response: AWSVideoRekognitionResponseModel = try? JSONDecoder().decode(AWSVideoRekognitionResponseModel.self, from: data) {
            completion(response, nil)
        } else {
            completion(nil, NSError(domain: "hackathonglobo2019", code: 001, userInfo: ["message": "Can't load data"]))
        }
    }
}
