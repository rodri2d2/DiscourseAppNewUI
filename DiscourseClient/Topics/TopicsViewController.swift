//
//  TopicsViewController.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 01/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// ViewController que representa un listado de topics
class TopicsViewController: UIViewController {

    
    // MARK: - Class properties
    let viewModel: TopicsViewModel
    
    // MARK: - Outlets
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.dataSource = self
        table.delegate   = self
        table.register(TopicCell.self, forCellReuseIdentifier: TopicCell.description())
        return table
    }()
    
    lazy var fab: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = 32
        view.setImage(UIImage(named: "icoFAB"), for: .normal)
        return view
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let view = UIRefreshControl()
        view.attributedTitle  = NSAttributedString(string: "Pull to refresh")
        view.addTarget(self, action: #selector(didPullRefresh), for: .valueChanged)
        return view
    }()

    
    // MARK: - Lifecycle
    init(viewModel: TopicsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewWasLoaded()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .discourseWhite
        view.addSubview(tableView)
        tableView.pinWintSafety(to: view)
        //
        view.addSubview(fab)
        setupOutlets()
    }



    // MARK: - Actions
    @objc func plusButtonTapped() {
        viewModel.plusButtonTapped()
    }
    
    @objc func didPullRefresh(){
        DispatchQueue.main.async {
            self.viewModel.viewWasLoaded()
            self.refreshControl.endRefreshing()
           
        }
    }

    // MARK: - Class functionalities
    fileprivate func showErrorFetchingTopicsAlert() {
        let alertMessage: String = NSLocalizedString("Error fetching topics\nPlease try again later", comment: "")
        showAlert(alertMessage)
    }
    
    
    private func setupOutlets(){
        
        setupFABButton()
        setupRefreshControl()
        setupNavigationBar()
    }
    
    private func setupNavigationBar(){
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isTranslucent      = true
        self.navigationController?.navigationBar.isOpaque           = true
        self.navigationController?.navigationBar.backgroundColor    = UIColor.discourseWhite
        
        //Navigation Bar Shadow related
        self.navigationController?.navigationBar.layer.shadowRadius  = 1
        self.navigationController?.navigationBar.layer.shadowOffset  = CGSize(width: 0, height: 2)
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.3
        self.navigationController?.navigationBar.layer.shadowColor   = UIColor.discourseGray.cgColor
    }
    
    private func setupFABButton(){
       
        fab.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            fab.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            fab.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        
        ])
        
       
        fab.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    }
    
    
    private func setupRefreshControl(){
        self.tableView.refreshControl = self.refreshControl
        
    }
    
    
}

extension TopicsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TopicCell.description(), for: indexPath) as? TopicCell,
            let cellViewModel = viewModel.viewModel(at: indexPath) {
            cellViewModel.cellViewModelDelegate = self
            cell.viewModel = cellViewModel
            return cell
        }

        fatalError()
    }
}


extension TopicsViewController: TopicCellViewModelDelegate{
    func didFetchImage() {
        tableView.reloadData()
    }
}

extension TopicsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.didSelectRow(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(96)
    }
}

extension TopicsViewController: TopicsViewDelegate {
    func topicsFetched() {
        tableView.reloadData()
    }

    func errorFetchingTopics() {
        showErrorFetchingTopicsAlert()
    }
}
