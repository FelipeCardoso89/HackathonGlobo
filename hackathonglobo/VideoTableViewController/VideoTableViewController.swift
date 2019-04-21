//
//  VideoTableViewController.swift
//  hackathonglobo
//
//  Created by Felipe Antonio Cardoso on 20/04/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class VideoTableViewController: UIViewController {

    private let viewModel = VideoTableViewModel()
    
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var videosTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Videos"
        screenTitleLabel.text = title
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        viewModel.delegate = self
        viewModel.loadVideos()
        
        videosTableView.delegate = self
        videosTableView.dataSource = self
        videosTableView.separatorStyle = .none
        
        videosTableView.registerCell(of: VideoTableCell.self)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension VideoTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(at: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(VideoTableCell.self, for: indexPath)
        cell.configure(with: VideoTableViewCellModel(video: viewModel.video(at: indexPath)))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueVideoDetail", sender: nil)
    }
}

extension VideoTableViewController: VideoTableViewModelDelegate {
    
    func didLoadVideos() {
        DispatchQueue.main.async {
            self.videosTableView.reloadData()
        }
    }
    
}

