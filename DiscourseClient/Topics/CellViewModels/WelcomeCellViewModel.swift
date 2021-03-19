//
//  WelcomeCellViewModel.swift
//  DiscourseClient
//
//  Created by Rodrigo  Candido on 19/3/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation
class WelcomeCellViewModel: CellViewModel{
    
    var type: CellType
    var titleLabelText: String?
    var bodyLabelText: String?
    
    init(cellType: CellType, topic: Topic) {
        self.type = cellType
        self.titleLabelText = topic.title
    }
    
}
