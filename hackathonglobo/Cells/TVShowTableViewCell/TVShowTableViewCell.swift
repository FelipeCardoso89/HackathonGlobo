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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        contentView.layer.cornerRadius = 20
    }
    
}

extension TVShowTableViewCell: ViewConfigurable {
    
    typealias ViewModel = TVShowTableCellViewModel
    
    func configure(with viewModel: TVShowTableCellViewModel?) {
        self.iconImageView.image = UIImage(named: viewModel!.imageName)!
        self.titleLabel.text = viewModel?.title
        self.subtitle.text = viewModel?.subtitle
    }
}
