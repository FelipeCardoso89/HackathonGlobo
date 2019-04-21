//
//  AWSVideoRekognitionResponseModel.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 20/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct AWSVideoRekognitionResponseModel: Decodable {
    let fileName: String
    let moderationLabel: [ModerationLabelElement]
    let celebrities: [CelebrityElement]
    let labels: [LabelElement]
    
    enum CodingKeys: String, CodingKey {
        case fileName = "fileName"
        case moderationLabel = "ModerationLabels"
        case celebrities = "Celebrities"
        case labels = "Labels"
    }
    
    init(fileName: String, moderationLabel:  [ModerationLabelElement], celebrities: [CelebrityElement], labels: [LabelElement]) {
        self.fileName = fileName
        self.moderationLabel = moderationLabel
        self.celebrities = celebrities
        self.labels = labels
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let fileName = try values.decode(String.self, forKey: .fileName)
        let moderationLabel = try values.decode([ModerationLabelElement].self, forKey: .moderationLabel)
        let celebrities = try values.decode([CelebrityElement].self, forKey: .celebrities)
        let labels = try values.decode([LabelElement].self, forKey: .labels)
        self.init(fileName: fileName, moderationLabel: moderationLabel, celebrities: celebrities, labels: labels)
    }
    
}
