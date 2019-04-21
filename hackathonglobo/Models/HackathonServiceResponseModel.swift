//
//  HackathonServiceResponseModel.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct HackathonServiceResponseModel: Codable {
    let ID: String
    let programa: String
    let tema: String
    let mood: String
    let negative: String
    let tags: String
    let horario: String
    let celebridades: String
    
    enum CondingKeys: String, CodingKey {
        case ID
        case programa
        case tema
        case mood
        case negative
        case tags
        case horario
        case celebridades
    }
    
    init(ID: String, programa: String, tema: String, mood: String, negative: String, tags: String, horario: String, celebridades: String) {
        self.ID = ID
        self.programa = programa
        self.tema = tema
        self.mood = mood
        self.negative = negative
        self.tags = tags
        self.horario = horario
        self.celebridades = celebridades
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let ID = try values.decode(String.self, forKey: .ID)
        let programa = try values.decode(String.self, forKey: .programa)
        let tema = try values.decode(String.self, forKey: .tema)
        let mood = try values.decode(String.self, forKey: .mood)
        let negative = try values.decode(String.self, forKey: .negative)
        let tags = try values.decode(String.self, forKey: .tags)
        let horario = try values.decode(String.self, forKey: .horario)
        let celebridades = try values.decode(String.self, forKey: .celebridades)
        
        
        self.init(ID: ID, programa: programa, tema: tema, mood: mood, negative: negative, tags: tags, horario: horario, celebridades: celebridades)
    }
}

