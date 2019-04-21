//
//  WebMediaTableViewCell.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class WebMediaTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.clipsToBounds = true
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        containerView.layer.cornerRadius = 8
    }
}

extension WebMediaTableViewCell: ViewConfigurable {

    typealias ViewModel = WebMediaTableCellViewModel
    
    func configure(with viewModel: WebMediaTableCellViewModel?) {
        titleLabel.text = viewModel?.title
        
        if let imageName = viewModel?.imageName {
            iconImageView.image = UIImage(named: imageName)
        }
    }
    
}
