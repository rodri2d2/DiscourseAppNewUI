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
            nameLabel.text  = viewModel.textLabelText
            imageView.image = viewModel.userImage
            
            UIView.animate(withDuration: 2) {
                self.imageView.alpha = 1
                self.nameLabel.alpha = 1

            }
            
        }
    }
    
    
    // MARK: - Outlets
    private let imageFrameView = UIView()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.alpha = 0
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = .systemFont(ofSize: 15, weight: .regular)
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        view.alpha = 0
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
        self.imageView.image = nil
        self.nameLabel.text = nil
    }
    
    
    // MARK: - Class functionalities
    
    //Outlet related funcionalities
    private func setupOutlets(){
        setupFrameView()
        setupImageView()
        setupNameLabel()
    }
    
    private func setupFrameView(){
        self.contentView.addSubview(imageFrameView)
        imageFrameView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageFrameView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imageFrameView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -44),
            imageFrameView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 7),
            imageFrameView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -7)
        ])
    }
    
    private func setupImageView(){
        self.imageFrameView.addSubview(imageView)
        imageView.pin(to: imageFrameView)
        imageView.layer.cornerRadius = imageView.frame.width / 2
        
    }
    
    private func setupNameLabel(){
        self.contentView.addSubview(nameLabel)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageFrameView.bottomAnchor, constant: 9),
            nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -18),
            nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        ])
    }
}


extension UsersCollectionCell: UserCellViewModelViewDelegate {
    func userImageFetched() {

        self.imageView.image = self.viewModel?.userImage
        setNeedsLayout()
    }
}

