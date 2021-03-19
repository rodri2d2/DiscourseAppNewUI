//
//  TopicsViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 01/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// Delegate a través del cual nos vamos a comunicar con el coordinator, contándole todo aquello que atañe a la navegación
protocol TopicsCoordinatorDelegate: class {
    func didSelect(topic: Topic)
    func topicsPlusButtonTapped()
}

/// Delegate a través del cual vamos a comunicar a la vista eventos que requiran pintar el UI, pasándole aquellos datos que necesita
protocol TopicsViewDelegate: class {
    func topicsFetched()
    func errorFetchingTopics()
}

/// ViewModel que representa un listado de topics
class TopicsViewModel {
    weak var coordinatorDelegate: TopicsCoordinatorDelegate?
    weak var viewDelegate: TopicsViewDelegate?
    let topicsDataManager: TopicsDataManager
    var topicViewModels: [CellViewModel] = []
    
    init(topicsDataManager: TopicsDataManager) {
        self.topicsDataManager = topicsDataManager
    }
    
    fileprivate func fetchTopicsAndReloadUI() {
        topicsDataManager.fetchAllTopics { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                guard let response = response else { return }
                
                
                let users = response.users
                self.topicViewModels = response.topicList.topics.map({ (topic) in
                    
                    let user = users.filter { (user) -> Bool in
                        user.username.localizedCaseInsensitiveContains(topic.lastPosterUsername)
                    }
                    
                    //Welcome topic will always be the first
                    if (topic.pinned) && (topic.id == 7){
                        return WelcomeCellViewModel(cellType: .welcome, topic: topic)
                    }
                    
                    return TopicCellViewModel(cellType: .normal, topic: topic, avatarURL: user.first?.avatarTemplate ?? "", dataManager: self.topicsDataManager)
                })
                
                self.viewDelegate?.topicsFetched()
            case .failure:
                self.viewDelegate?.errorFetchingTopics()
            }
        }
    }
    
    func viewWasLoaded() {
        fetchTopicsAndReloadUI()
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return topicViewModels.count
    }
    
    func viewModel(at indexPath: IndexPath) -> CellViewModel? {
        guard indexPath.row < topicViewModels.count else { return nil }
        
        if topicViewModels[indexPath.row].type == .normal {
            return topicViewModels[indexPath.row] as! TopicCellViewModel
        }else{
            return topicViewModels[indexPath.row] as! WelcomeCellViewModel
        }
        
       
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        guard indexPath.row < topicViewModels.count else { return }
        let topicViewModel = topicViewModels[indexPath.row] as! TopicCellViewModel
        coordinatorDelegate?.didSelect(topic: topicViewModel.topic)
    }
    
    func plusButtonTapped() {
        coordinatorDelegate?.topicsPlusButtonTapped()
    }
    
    func newTopicWasCreated() {
        fetchTopicsAndReloadUI()
    }
    
    func topicWasDeleted() {
        fetchTopicsAndReloadUI()
    }
}
