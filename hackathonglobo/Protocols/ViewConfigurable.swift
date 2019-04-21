//
//  ViewConfigurable.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation
import UIKit

protocol ViewConfigurable {
    
    associatedtype ViewModel
    
    func configure(with viewModel: ViewModel?)
}


