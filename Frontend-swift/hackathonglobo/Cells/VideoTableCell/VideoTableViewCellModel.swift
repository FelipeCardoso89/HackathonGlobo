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
    let isProcessing: Bool
    
    init(title: String, subtitle: String, iconURl: String?, isProcessing: Bool) {
        self.title = title
        self.subtitle = subtitle
        self.iconUrl = iconURl
        self.isProcessing = isProcessing
    }
    
    init(video: VideoModel) {
        self.init(
            title: video.title,
            subtitle: (video.state == .none) ? video.subtitle : video.state.message,
            iconURl: video.iconURL,
            isProcessing: video.isProcessing
        )
    }
}
