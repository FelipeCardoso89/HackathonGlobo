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
    
    private let viewModel = ViewDetailTableViewModel()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        screenTitleLabel.text = "Recomendações"
        
        viewModel.delegate = self
        
        backButton.layer.cornerRadius = 25.0
        backButton.clipsToBounds = true
        
        videoDetailTableView.delegate = self
        videoDetailTableView.dataSource = self
        videoDetailTableView.separatorStyle = .none
        
        videoDetailTableView.registerCell(of: ValidationTableViewCell.self)
        videoDetailTableView.registerCell(of: TVShowTableViewCell.self)
        videoDetailTableView.registerCell(of: WebMediaTableViewCell.self)
        
        viewModel.loadVideoData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.submit()
    }
    
    @IBAction func didPressBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension VideoDetailTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let num = viewModel.numberOfSections()
        return num
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let num = viewModel.numberOfRows(at: section)
        return num
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sec = viewModel.section(at: indexPath)
        
        switch sec {
        case let .validations(items):
            let item = items[indexPath.row]
            let cell = videoDetailTableView.dequeueReusableCell(ValidationTableViewCell.self, for: indexPath)
            cell.configure(with: item)
            return cell
            
        case let .television(items):
            let item = items[indexPath.row]
            let cell = videoDetailTableView.dequeueReusableCell(TVShowTableViewCell.self, for: indexPath)
            cell.configure(with: TVShowTableCellViewModel(model: item))
            return cell

        case let .web(items):
            let item = items[indexPath.row]
            let cell = videoDetailTableView.dequeueReusableCell(WebMediaTableViewCell.self, for: indexPath)
            cell.configure(with: item)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sec = viewModel.section(at: IndexPath(row: 0, section: section))
        
        let view: SectionHeaderView = Bundle.main.loadNibNamed("SectionHeaderView", owner: SectionHeaderView.self, options: nil)?.first! as! SectionHeaderView
        view.titleLabel.text = sec.headerTitle
        view.subtitleLabel.text = sec.headerSubtitle
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sec = viewModel.section(at: IndexPath(row: 0, section: section))
        return sec.height
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
