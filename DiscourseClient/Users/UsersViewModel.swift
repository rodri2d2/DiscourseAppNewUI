//
//  UsersViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 28/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

protocol UsersViewModelCoordinatorDelegate: class {
    func didSelect(username: String)
}

protocol UsersViewModelViewDelegate: class {
    func usersWereFetched()
    func errorFetchingUsers()
}

/// ViewModel representando un listado de usuarios
class UsersViewModel {
    weak var coordinatorDelegate: UsersViewModelCoordinatorDelegate?
    weak var viewDelegate: UsersViewModelViewDelegate?
    var userViewModels: [UserCellViewModel] = []
    let usersDataManager: UsersDataManager

    init(usersDataManager: UsersDataManager) {
        self.usersDataManager = usersDataManager
    }

    func viewWasLoaded() {
        usersDataManager.fetchAllUsers { [weak self] (result) in
            switch result {
            case .success(let response):
                guard let response = response else { return }

                self?.userViewModels = response.directoryItems.map({ UserCellViewModel(user: $0.user) })
                self?.viewDelegate?.usersWereFetched()
            case .failure:
                self?.viewDelegate?.errorFetchingUsers()
            }
        }
    }

    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(in section: Int) -> Int {
        return userViewModels.count
    }

    func viewModel(at indexPath: IndexPath) -> UserCellViewModel? {
        guard indexPath.row < userViewModels.count else { return nil }
        return userViewModels[indexPath.row]
    }

    func didSelectRow(at indexPath: IndexPath) {
        coordinatorDelegate?.didSelect(username: userViewModels[indexPath.row].user.username)
    }
}
