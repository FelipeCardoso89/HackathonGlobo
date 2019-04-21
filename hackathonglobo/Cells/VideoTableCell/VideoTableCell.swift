//
//  VideoTableCell.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 20/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class VideoTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        containerView.layer.cornerRadius = 4.0
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor.black.cgColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension VideoTableCell: ViewConfigurable {
    
    typealias ViewModel = VideoTableViewCellModel
    
    func configure(with viewModel: VideoTableViewCellModel?) {
        titleLabel.text = viewModel?.title
        subtitleLabel.text = viewModel?.subtitle
        
        if let imageName = viewModel?.iconUrl {
            thumbnailImageView.image = UIImage(named: imageName)
        }
        
        if viewModel?.isProcessing ?? false {
            thumbnailImageView.isHidden = true
            activityIndicator.startAnimating()
        } else {
            thumbnailImageView.isHidden = false
            activityIndicator.stopAnimating()
        }
    }
}
