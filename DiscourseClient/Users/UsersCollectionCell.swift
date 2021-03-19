//
//  UsersCollectionCell.swift
//  DiscourseClient
//
//  Created by Rodrigo  Candido on 15/3/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

class UsersCollectionCell: UICollectionViewCell {
    
    // MARK: - Class properties
    var viewModel: UserCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            viewModel.viewDelegate = self
            
            if let image = viewModel.userImage{
                self.collectionItem.updateImage(image: image)
                
            }
            
            if let text = viewModel.textLabelText{
                self.collectionItem.updateText(text: text)
            }
            
        }
    }
    
    
    // MARK: - Outlets
    lazy var collectionItem: UserCollectionItem = {
        let view = UserCollectionItem()
        return view
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupOutlets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        collectionItem.prepareForReuse()
    }
    
    
    // MARK: - Class functionalities
    private func setupOutlets(){
        self.contentView.addSubview(collectionItem)
        self.collectionItem.translatesAutoresizingMaskIntoConstraints = false
        self.collectionItem.pin(to: self.contentView)
    }
    
}


extension UsersCollectionCell: UserCellViewModelViewDelegate {
    func userImageFetched() {
        guard let viewModel = self.viewModel else { return}
        if let image = viewModel.userImage{
            self.collectionItem.updateImage(image: image)
            
        }
        
        if let text = viewModel.textLabelText{
            self.collectionItem.updateText(text: text)
        }
        setNeedsLayout()
    }
}

