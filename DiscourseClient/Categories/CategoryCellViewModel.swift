//
//  CategoryCellViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 28/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

class CategoryCellViewModel {
    let category: Category
    let textLabelText: String?

    init(category: Category) {
        self.category = category
        textLabelText = category.name
    }
}
