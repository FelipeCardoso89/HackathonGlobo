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
    @IBOutlet weak var addButton: UIButton!
    
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
        
        addButton.layer.cornerRadius = 25
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "GoToNewSubmission":
            ((segue.destination as? UINavigationController)?.viewControllers.first as? UploadVideoViewController)?.delegate = self
        default:
            break
        }
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

extension VideoTableViewController: UploadVideoViewControllerDelegate {
    
    func didFinish() {
        viewModel.addNewItem()
        videosTableView.beginUpdates()
        videosTableView.insertRows(at: [IndexPath(item: 0, section: 0)], with: .fade)
        videosTableView.endUpdates()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.viewModel.reloadNewItem()
            self.videosTableView.beginUpdates()
            self.videosTableView.reloadRows(at: [IndexPath(item: 0, section: 0)], with: .fade)
            self.videosTableView.endUpdates()
        }
    }
}

