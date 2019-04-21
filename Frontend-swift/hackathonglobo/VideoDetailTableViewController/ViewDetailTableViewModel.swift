//
//  ViewDetailTableViewModel.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation
import UIKit

enum VideoDetailSection {
    case validations(items: [ValidationTableCellViewModel])
    case television(items: [HackathonServiceResponseModel])
    case web(items: [WebMediaTableCellViewModel])
}

extension VideoDetailSection {
    
    var items: [Any] {
        switch self {
        case let .television(items):
            return items
        case let .validations(items):
            return items
        case let .web(items):
            return items
        }
    }
    
    var headerTitle: String {
        switch self {
        case .television:
            return "Televisão"
        case .validations:
            return "Validações"
        case .web:
            return "Mídia online"
            
        }
    }
    
    var headerSubtitle: String {
        switch self {
        case .television:
            return "As recomendações abaixo foram feitas baseados no vídeo que submeteu para análise através do Globo Ads+"
        case .validations:
            return "Validações automáticas feitas pela nossa plataforma"
        case .web:
            return "Sugerimos também inserção de propaganda por vídeo nas seguintes plataformas"
        }
    }
    
    var height: CGFloat {
        switch self {
        case .television:
            return 180
        case .validations:
            return 160
        case .web:
            return 160
            
        }
    }
}

protocol ViewDetailTableViewModelDelegate: class {
    func didLoadVideoData()
    func didFailLoadData()
}

class ViewDetailTableViewModel {
    
    private var sections = [String: VideoDetailSection]()
    
    weak var delegate: ViewDetailTableViewModelDelegate?
    
    func loadVideoData() {
        sections["0"] = .validations(items: [
            ValidationTableCellViewModel(title: "Nenhuma infração as diretrizes encontrada."),
            ValidationTableCellViewModel(title: "Nenhum conteúdo ofensivo encontrado."),
            ValidationTableCellViewModel(title: "Nenhuma infração as diretrizes tecnicas encontrada.")
        ])
        sections["1"] = .television(items: [
            HackathonServiceResponseModel(
                ID: "123",
                programa: "Como Sera?",
                tema: "Cuidados com a casa",
                mood: "Felicidade, Alegria",
                negative: "",
                tags: "Casa, Carro, Mulher, Saúde",
                horario: "09:00",
                celebridades: "Sandra Anenbergue",
                imageURL: "como_sera"
            )
        ])
        sections["2"] = .web(items: [
            WebMediaTableCellViewModel(title: "GLOBOPLAY", imageName: "globo_play"),
            WebMediaTableCellViewModel(title: "GLOBOSATPLAY", imageName: "globo_sat_play"),
            WebMediaTableCellViewModel(title: "G1", imageName: "g1"),
        ])
    }
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfRows(at section: Int) -> Int {
        
        guard let sec = sections[String(section)] else {
            return 0
        }
        
        return sec.items.count
    }
    
    func section(at indexPath: IndexPath) -> VideoDetailSection {
        return sections[String(indexPath.section)]!
    }
    
    func submit() {
        
        let metadata = AnalysisModel(mood: ["joy"], tags: ["religiao", "viagem"], celebridade: "Grazi Massafera")
        submitToAnalysis(metadata: metadata) { (model, error) in
            if let model = model {

                let value: VideoDetailSection = self.sections["1"]!
                var oldItems = value.items
                oldItems.append(model)
                self.sections.updateValue(.television(items: oldItems as! [HackathonServiceResponseModel]), forKey: "1")
                
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
