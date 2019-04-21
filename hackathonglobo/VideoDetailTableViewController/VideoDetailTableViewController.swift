//
//  VideoDetailTableViewController.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 21/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class VideoDetailTableViewController: UIViewController {

    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var videoDetailTableView: UITableView!
    
    private let viewModel: ViewDetailTableViewModel? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        screenTitleLabel.text = "Recomendações"
        
        viewModel?.delegate = self
        
        backButton.layer.cornerRadius = 25.0
        backButton.clipsToBounds = true
        
        videoDetailTableView.separatorStyle = .none
        
        videoDetailTableView.registerCell(of: TVShowTableViewCell.self)
        videoDetailTableView.registerCell(of: WebMediaTableViewCell.self)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.submit()
    }
    
    @IBAction func didPressBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}


extension VideoDetailTableViewController: ViewDetailTableViewModelDelegate {
    func didFailLoadData() {
        
    }
    
    func didLoadVideoData() {
        DispatchQueue.main.async {
            self.videoDetailTableView.reloadData()
        }
    }
}
