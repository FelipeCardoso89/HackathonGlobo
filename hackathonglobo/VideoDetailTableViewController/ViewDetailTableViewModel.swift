//
//  ViewDetailTableViewModel.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

enum VideoDetailSection {
    case validations
    case television(items: [HackathonServiceResponseModel])
    case web
}

extension VideoDetailSection {
    
    var items: [HackathonServiceResponseModel] {
        switch self {
        case let .television(items):
            return items
        default:
            return []
        }
    }
}

protocol ViewDetailTableViewModelDelegate: class {
    func didLoadVideoData()
    func didFailLoadData()
}

class ViewDetailTableViewModel {
    
    private var sections = [NSNumber: VideoDetailSection]()
    
    weak var delegate: ViewDetailTableViewModelDelegate?
    
    func loadVideoData() {
        sections[NSNumber(value: 0)] = .validations
        sections[NSNumber(value: 1)] = .television(items: [])
        sections[NSNumber(value: 2)] = .web
    }
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfRows(at section: Int) -> Int {
        return sections[NSNumber(value: section)]?.items.count ?? 0
    }
    
    func submit() {
        
        let metadata = AnalysisModel(mood: ["joy"], tags: ["religiao", "viagem"], celebridade: "Grazi Massafera")
        submitToAnalysis(metadata: metadata) { (model, error) in
            if let model = model {
                self.sections.updateValue(VideoDetailSection.television(items: [model]), forKey: NSNumber(value: 1))
                self.delegate?.didLoadVideoData()
            } else {
                self.delegate?.didFailLoadData()
            }
        }
        
    }
    
    private func submitToAnalysis(metadata: AnalysisModel, completion:((HackathonServiceResponseModel?, Error?) -> Void)?) {
        
        var request = URLRequest(url: URL(string: "http://localhost:8888/HackathonGloboBackend/HandleRequest.php")!)
        request.httpMethod = "POST"
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(metadata)
            // ... and set our request's HTTP body
            request.httpBody = jsonData
            print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        } catch {
            completion?(nil, error)
        }
        
        // Create and run a URLSession data task with our JSON encoded POST request
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else {
                completion?(nil, responseError!)
                return
            }
            
            // APIs usually respond with the data you just sent in your POST request
            
            if let data = responseData, let model = try? JSONDecoder().decode(HackathonServiceResponseModel.self, from: data) {
                print("response: ", model)
                completion?(model, nil)
            } else {
                completion?(nil, NSError(domain: "hackathon", code: 001, userInfo: nil))
            }
        }
        task.resume()
    }
    
}
