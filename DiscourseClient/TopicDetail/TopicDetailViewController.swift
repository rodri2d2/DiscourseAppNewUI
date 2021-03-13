//
//  TopicDetailViewController.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// ViewController que representa el detalle de un Topic
class TopicDetailViewController: UIViewController {

    lazy var labelTopicID: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var labelTopicTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var topicIDStackView: UIStackView = {
        let labelTopicIDTitle = UILabel()
        labelTopicIDTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTopicIDTitle.text = NSLocalizedString("Topic ID: ", comment: "")
        labelTopicIDTitle.textColor = .black

        let topicIDStackView = UIStackView(arrangedSubviews: [labelTopicIDTitle, labelTopicID])
        topicIDStackView.translatesAutoresizingMaskIntoConstraints = false
        topicIDStackView.axis = .horizontal

        return topicIDStackView
    }()

    lazy var topicNameStackView: UIStackView = {
        let labelTopicTitleTitle = UILabel()
        labelTopicTitleTitle.text = NSLocalizedString("Topic name: ", comment: "")
        labelTopicTitleTitle.translatesAutoresizingMaskIntoConstraints = false

        let topicNameStackView = UIStackView(arrangedSubviews: [labelTopicTitleTitle, labelTopicTitle])
        topicNameStackView.translatesAutoresizingMaskIntoConstraints = false
        topicNameStackView.axis = .horizontal

        return topicNameStackView
    }()

    lazy var postsNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var postsNumberStackView: UIStackView = {
        let postsNumberTitleLabel = UILabel()
        postsNumberTitleLabel.text = NSLocalizedString("Number of posts: ", comment: "")
        postsNumberTitleLabel.translatesAutoresizingMaskIntoConstraints = false

        let postsNumberStackView = UIStackView(arrangedSubviews: [postsNumberTitleLabel, postsNumberLabel])
        postsNumberStackView.translatesAutoresizingMaskIntoConstraints = false
        postsNumberStackView.axis = .horizontal

        return postsNumberStackView
    }()

    let deleteTopicButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("DELETE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        return button
    }()

    let viewModel: TopicDetailViewModel

    init(viewModel: TopicDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        view.addSubview(topicIDStackView)
        NSLayoutConstraint.activate([
            topicIDStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            topicIDStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])

        view.addSubview(topicNameStackView)
        NSLayoutConstraint.activate([
            topicNameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            topicNameStackView.topAnchor.constraint(equalTo: topicIDStackView.bottomAnchor, constant: 8)
        ])

        view.addSubview(postsNumberStackView)
        NSLayoutConstraint.activate([
            postsNumberStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            postsNumberStackView.topAnchor.constraint(equalTo: topicNameStackView.bottomAnchor, constant: 8)
        ])

        view.addSubview(deleteTopicButton)
        NSLayoutConstraint.activate([
            deleteTopicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteTopicButton.topAnchor.constraint(equalTo: postsNumberStackView.bottomAnchor, constant: 8)
        ])
        deleteTopicButton.isHidden = true

        let leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        leftBarButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }

    @objc func backButtonTapped() {
        viewModel.backButtonTapped()
    }

    @objc func deleteButtonTapped() {
        viewModel.deleteButtonTapped()
    }

    fileprivate func showErrorFetchingTopicDetailAlert() {
        let alertMessage: String = NSLocalizedString("Error fetching topic detail\nPlease try again later", comment: "")
        showAlert(alertMessage)
    }

    fileprivate func showErrorDeletingTopic() {
        let alertMessage: String = NSLocalizedString("Error deleting topic\nPlease try again later", comment: "")
        showAlert(alertMessage)
    }

    fileprivate func updateUI() {
        labelTopicID.text = viewModel.labelTopicIDText
        labelTopicTitle.text = viewModel.labelTopicNameText
        postsNumberLabel.text = viewModel.postsNumberLabelText
        deleteTopicButton.isHidden = viewModel.deleteTopicButtonIsHidden
    }
}

extension TopicDetailViewController: TopicDetailViewDelegate {
    func topicDetailFetched() {
        updateUI()
    }

    func errorFetchingTopicDetail() {
        showErrorFetchingTopicDetailAlert()
    }

    func errorDeletingTopic() {
        showErrorDeletingTopic()
    }
}
