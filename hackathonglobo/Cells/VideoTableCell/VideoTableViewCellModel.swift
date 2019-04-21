//
//  VideoTableViewCellModel.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct VideoTableViewCellModel {
    
    let title: String
    let subtitle: String
    let iconUrl: String?
    
    init(title: String, subtitle: String, iconURl: String?) {
        self.title = title
        self.subtitle = subtitle
        self.iconUrl = iconURl
    }
    
    init(video: VideoModel) {
        self.init(
            title: video.title,
            subtitle: video.subtitle,
            iconURl: video.iconURL
        )
    }
}
