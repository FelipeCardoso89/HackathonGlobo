//
//  TVShowTableCellViewModel.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct TVShowTableCellViewModel {
    let imageName: String?
    let title: String
    let subtitle: String
    
    init(imageName: String?, title: String, subtitle: String) {
        self.imageName = imageName
        self.title = title
        self.subtitle = subtitle
    }
    
    init(model: HackathonServiceResponseModel) {
        self.init(imageName: model.imageURL, title: model.programa, subtitle: "\(model.mood)")
    }
}
