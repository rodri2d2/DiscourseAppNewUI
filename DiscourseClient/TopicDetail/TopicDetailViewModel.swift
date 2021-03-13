//
//  TopicDetailViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// Delegate que usaremos para comunicar eventos relativos a navegación, al coordinator correspondiente
protocol TopicDetailCoordinatorDelegate: class {
    func topicDetailBackButtonTapped()
    func topicSuccessfullyDeleted()
}

/// Delegate para comunicar a la vista cosas relacionadas con UI
protocol TopicDetailViewDelegate: class {
    func topicDetailFetched()
    func errorFetchingTopicDetail()
    func errorDeletingTopic()
}

class TopicDetailViewModel {
    var labelTopicIDText: String?
    var labelTopicNameText: String?
    var postsNumberLabelText: String?
    var deleteTopicButtonIsHidden = true

    weak var viewDelegate: TopicDetailViewDelegate?
    weak var coordinatorDelegate: TopicDetailCoordinatorDelegate?
    let topicDetailDataManager: TopicDetailDataManager
    let topicID: Int

    init(topicID: Int, topicDetailDataManager: TopicDetailDataManager) {
        self.topicID = topicID
        self.topicDetailDataManager = topicDetailDataManager
    }

    func viewDidLoad() {
        topicDetailDataManager.fetchTopic(id: topicID) { [weak self] (result) in
            switch result {
            case .success(let response):
                guard let response = response else { return }

                self?.labelTopicIDText = "\(response.id)"
                self?.labelTopicNameText = response.title
                self?.postsNumberLabelText = "\(response.postsCount)"
                self?.deleteTopicButtonIsHidden = !(response.details.canDelete ?? false)

                self?.viewDelegate?.topicDetailFetched()
            case .failure:
                self?.viewDelegate?.errorFetchingTopicDetail()
            }
        }
    }

    func backButtonTapped() {
        coordinatorDelegate?.topicDetailBackButtonTapped()
    }

    func deleteButtonTapped() {
        topicDetailDataManager.deleteTopic(id: topicID) { [weak self] (result) in
            switch result {
            case .success:
                self?.coordinatorDelegate?.topicSuccessfullyDeleted()
            case .failure:
                self?.viewDelegate?.errorDeletingTopic()
            }
        }
    }
}
