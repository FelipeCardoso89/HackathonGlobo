//
//  VideoTableViewModel.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 20/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

enum Sections {
    case videos(items: [VideoModel])
}

extension Sections {
    
    var items: [VideoModel] {
        switch self {
        case let .videos(items):
            return items
        }
    }
}

protocol VideoTableViewModelDelegate: class {
    func didLoadVideos()
}

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
    
    private var sections = [Sections]()
    
    private let awsService: AWSRekognitionServiceManager
    private let amsService: AzureVideoIndexesServiceManager
    
    weak var delegate: VideoTableViewModelDelegate?
    
    convenience init() {
        self.init(
            awsService: AWSRekognitionServiceManager.shared,
            amsService: AzureVideoIndexesServiceManager.shared
        )
    }
    
    init(awsService: AWSRekognitionServiceManager, amsService: AzureVideoIndexesServiceManager) {
        self.awsService = awsService
        self.amsService = amsService
    }
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfRows(at section: Int) -> Int {
        return sections[section].items.count
    }
    
    func loadVideos() {
        sections = [.videos(items: [
            VideoModel(iconURL: "video1", title: "Publicidade Toyota", isProcessing: false),
            VideoModel(iconURL: "video2", title: "Publicidade Ambev", isProcessing: false),
            VideoModel(iconURL: "video3", title: "Publicidade Coca-Cola", isProcessing: false),
            VideoModel(iconURL: "video4", title: "Publicidade Samsung", isProcessing: false),
            VideoModel(iconURL: "video5", title: "Publicidade Jeep", isProcessing: false)
        ])]
    }
    
    func video(at indexPath: IndexPath) -> VideoModel {
        return sections[indexPath.section].items[indexPath.row]
    }
    
    
    func validadeVideo() {
        
        guard let awsData = VideoTableViewModel.loadAWSGraziData() else {
            return
        }

        awsService.performVideoAnalyses(for: awsData) { (response, error) in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Response: \(response)")
            }
        }
        
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
    

 
}
