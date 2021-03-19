//
//  AddTopicCoordinator.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// Coordinator del módulo add topic.
class AddTopicCoordinator: Coordinator {
    let presenter: UINavigationController
    let addTopicDataManager: AddTopicDataManager
    var addTopicNavigationController: UINavigationController?
    var onCancelTapped: (() -> Void)?
    var onTopicCreated: (() -> Void)?

    init(presenter: UINavigationController, addTopicDataManager: AddTopicDataManager) {
        self.presenter = presenter
        self.addTopicDataManager = addTopicDataManager
    }

    override func start() {
        let addTopicViewModel = AddTopicViewModel(dataManager: addTopicDataManager)
        addTopicViewModel.coordinatorDelegate = self

        let addTopicViewController = AddTopicViewController(viewModel: addTopicViewModel)
        addTopicViewModel.viewDelegate = addTopicViewController
        addTopicViewController.isModalInPresentation = true
        addTopicViewController.title = "Add topic"

        let navigationController = UINavigationController(rootViewController: addTopicViewController)
        self.addTopicNavigationController = navigationController
        presenter.present(navigationController, animated: true, completion: nil)
    }

    override func finish() {
        addTopicNavigationController?.dismiss(animated: true, completion: nil)
    }
}

extension AddTopicCoordinator: AddTopicCoordinatorDelegate {
    func addTopicCancelButtonTapped() {
        onCancelTapped?()
    }

    func topicSuccessfullyAdded() {
        onTopicCreated?()
    }
}
