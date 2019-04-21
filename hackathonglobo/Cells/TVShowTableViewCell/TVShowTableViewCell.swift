//
//  TVShowTableViewCell.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class TVShowTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
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

extension TVShowTableViewCell: ViewConfigurable {
    
    typealias ViewModel = TVShowTableCellViewModel
    
    func configure(with viewModel: TVShowTableCellViewModel?) {
        
        if let imageName = viewModel?.imageName, !imageName.isEmpty {
            self.iconImageView.image = UIImage(named: imageName)
        } else {
            self.iconImageView.image = UIImage(named: "hora1")!
        }
        
        self.titleLabel.text = viewModel?.title
        self.subtitle.text = viewModel?.subtitle
    }
}
