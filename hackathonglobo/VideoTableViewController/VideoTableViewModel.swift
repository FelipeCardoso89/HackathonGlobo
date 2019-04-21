//
//  VideoTableViewModel.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 20/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

class VideoTableViewModel {
    
    private let service: AWSRekognitionServiceManager
    
    convenience init() {
        self.init(service: AWSRekognitionServiceManager.shared)
    }
    
    init(service: AWSRekognitionServiceManager) {
        self.service = service
    }
    
    func validateVideo(at path: String) {
        
    }
    
    func validadeVideo() {
        
        guard
            let path = Bundle.main.path(forResource: "aws_grazi_massafera_campaing", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        else {
            return
        }
        
        service.performVideoAnalyses(for: data) { (response, error) in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Response: \(response)")
            }
        }
    }

    func loadVideos() {
        
    }
    
}
