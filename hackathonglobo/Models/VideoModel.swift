//
//  VideoModel.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

enum VideoState {
    case none
    case analisando
    case validando
    case procurando
    case procurandoOutrasMidias
    
    
    var message: String {
        
        switch self {
        case .none:
            return ""
        case .analisando:
            return "Preparando para analise..."
        case .validando:
            return "Validando caracteristicas do video..."
        case .procurando:
            return "Procurando oportunidades de anúncio..."
        case .procurandoOutrasMidias:
            return "Procurando oportunidade de anúncio em outras midias..."
        }
    }
}

struct VideoModel {
    let iconURL: String?
    let title: String
    let subtitle: String
    let isProcessing: Bool
    let state: VideoState
}
