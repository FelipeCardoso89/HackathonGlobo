//
//  ValidationTableViewCell.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class ValidationTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension ValidationTableViewCell: ViewConfigurable {
    
    typealias ViewModel = ValidationTableCellViewModel
    
    func configure(with viewModel: ValidationTableCellViewModel?) {
        messageLabel.text = viewModel?.title
    }
    
}
