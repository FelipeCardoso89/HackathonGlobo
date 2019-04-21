//
//  VideoTableViewModel.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 20/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

class VideoTableViewModel {

    static func loadAWSGraziData() -> Data? {
        guard
            let path = Bundle.main.path(forResource: "aws_grazi_massafera_campaing", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        else {
            return nil
        }
        
        return data
    }
    
    static func loadAzureGraziData() -> Data? {
        guard
            let path = Bundle.main.path(forResource: "azure_grazi_massafera_campiang", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        else {
            return nil
        }
        
        return data
    }
    
    private let awsService: AWSRekognitionServiceManager
    private let amsService: AzureVideoIndexesServiceManager
    
    
    convenience init() {
        self.init(awsService: AWSRekognitionServiceManager.shared, amsService: AzureVideoIndexesServiceManager.shared)
    }
    
    init(awsService: AWSRekognitionServiceManager, amsService: AzureVideoIndexesServiceManager) {
        self.awsService = awsService
        self.amsService = amsService
    }
    
    func validateVideo(at path: String) {
        
    }
    
    func validadeVideo() {
        
//        guard let awsData = VideoTableViewModel.loadAWSGraziData() else {
//            return
//        }
//
//        awsService.performVideoAnalyses(for: awsData) { (response, error) in
//            if let error = error {
//                print("Error: \(error)")
//            } else {
//                print("Response: \(response)")
//            }
//        }
        
        guard let amsData = VideoTableViewModel.loadAzureGraziData() else {
            return
        }
        
        amsService.performVideoAnalyses(for: amsData) { (response, error) in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Azure Response: \(response)")
            }
        }
        
    }

    func loadVideos() {
        
    }
    
}
