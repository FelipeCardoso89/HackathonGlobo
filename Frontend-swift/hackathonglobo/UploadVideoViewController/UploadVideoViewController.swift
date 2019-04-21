//
//  UploadVideoViewController.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

protocol UploadVideoViewControllerDelegate: class {
    func didFinish()
}

class UploadVideoViewController: UIViewController {

    @IBOutlet weak var btnCancel: UIBarButtonItem!
    @IBOutlet weak var btnContinue: UIButton!

    weak var delegate: UploadVideoViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Nova submissão"
        // Do any additional setup after loading the view.
        
        btnContinue.clipsToBounds = true
        btnContinue.layer.cornerRadius = 30
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "SecondStepUploadViewController":
            (segue.destination as? SecondStepUploadViewController)?.delegate = self.delegate
        default:
            break
        }
    }
    
    @IBAction func didPressCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didPressContinue(_ sender: Any) {
        
    }
    
}
