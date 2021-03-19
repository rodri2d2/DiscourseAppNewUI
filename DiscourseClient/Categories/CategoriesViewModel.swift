//
//  CategoriesViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

protocol CategoriesViewModelViewDelegate: class {
    func categoriesWereFetched()
    func errorFetchingCategories()
}

/// ViewModel representando un listado de categorías
class CategoriesViewModel {
    weak var viewDelegate: CategoriesViewModelViewDelegate?
    var categoryViewModels: [CategoryCellViewModel] = []
    let categoriesDataManager: CategoriesDataManager

    init(categoriesDataManager: CategoriesDataManager) {
        self.categoriesDataManager = categoriesDataManager
    }

    func viewWasLoaded() {
        categoriesDataManager.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let response):
                guard let response = response else { return }

                self?.categoryViewModels = response.categoryList.categories.map({ CategoryCellViewModel(category: $0) })
                self?.viewDelegate?.categoriesWereFetched()
            case .failure:
                self?.viewDelegate?.errorFetchingCategories()
            }
        }
    }

    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(in section: Int) -> Int {
        return categoryViewModels.count
    }

    func viewModel(at indexPath: IndexPath) -> CategoryCellViewModel? {
        guard indexPath.row < categoryViewModels.count else { return nil }
        return categoryViewModels[indexPath.row]
    }
}
