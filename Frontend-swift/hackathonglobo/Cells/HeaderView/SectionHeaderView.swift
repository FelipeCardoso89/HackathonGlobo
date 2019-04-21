//
//  SectionHeaderView.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class SectionHeaderView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

}

extension SectionHeaderView: ViewConfigurable {
    
    typealias ViewModel = SectionHeaderViewModel
    
    func configure(with viewModel: SectionHeaderViewModel?) {
        titleLabel.text = viewModel?.title
        subtitleLabel.text = viewModel?.subtitle
    }

}
