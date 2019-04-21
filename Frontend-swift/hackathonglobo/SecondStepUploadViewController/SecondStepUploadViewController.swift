//
//  SecondStepUploadViewController.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class SecondStepUploadViewController: UIViewController {
   
    @IBOutlet weak var btnContinue: UIButton!
    
    weak var delegate: UploadVideoViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnContinue.clipsToBounds = true
        btnContinue.layer.cornerRadius = 30
    }
    
    @IBAction func didPressContinue(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: {
            self.delegate?.didFinish()
        })
    }
    
}
