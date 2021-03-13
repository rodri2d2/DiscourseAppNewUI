//
//  UserCell.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 28/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    var viewModel: UserCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            viewModel.viewDelegate = self
            
            textLabel?.text = viewModel.textLabelText
            imageView?.image = viewModel.userImage
        }
    }
}

extension UserCell: UserCellViewModelViewDelegate {
    func userImageFetched() {
        imageView?.image = viewModel?.userImage
        setNeedsLayout()
    }
}
