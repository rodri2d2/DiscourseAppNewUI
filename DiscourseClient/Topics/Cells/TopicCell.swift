//
//  TopicCellTableViewCell.swift
//  DiscourseClient
//
//  Created by Rodrigo  Candido on 15/3/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

class TopicCell: UITableViewCell {
    
    // MARK: - Class properties
    var viewModel: TopicCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            self.viewModel?.cellViewModelDelegate = self
            topicLabel.text = viewModel.textLabelText
            
            
            if let posts = viewModel.posts,
               let users = viewModel.postUserCount,
               let date = viewModel.createdAt {
                topicCommentsView.updateViewItems(numberOfPosts: posts, usersByPost: users, createdAt: date)
            }
            
            self.topicImage.image = (viewModel.image != nil) ? UIImage(data: viewModel.image!) : UIImage(named: "avatar")
        }
    }
    
    // MARK: - Outlets
    lazy var topicLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 17)
        view.numberOfLines = 2
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping
        view.alpha = 0
        return view
    }()
    
    lazy var topicImage: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.alpha = 0
        return view
    }()
    
    lazy var topicCommentsView: TopicCommentsView = {
        let view = TopicCommentsView()
        view.alpha = 0
        return view
    }()
    
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupOutlets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Class functionalities
    private func setupOutlets(){
        //
        setupTopicLabel()
        setupTopicImage()
        setupCommentsView()
    }
    
    private func setupTopicLabel(){
        self.contentView.addSubview(topicLabel)
        topicLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            //Contraint from edges
            topicLabel.topAnchor.constraint     (equalTo: self.contentView.topAnchor,       constant: 14),
            topicLabel.leadingAnchor.constraint (equalTo: self.contentView.leadingAnchor,   constant: 91),
            topicLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,  constant: -59)
            
        ])
    }
    
    private func setupTopicImage(){
        
        self.contentView.addSubview(topicImage)
        topicImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            //Position
            topicImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            
            //Contraint from edges
            topicImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
        ])
        
        topicImage.layer.cornerRadius = 32
    }
    
    private func setupCommentsView(){
        self.contentView.addSubview(topicCommentsView)
        topicCommentsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //Contraint from edges
            topicCommentsView.topAnchor.constraint    (equalTo: self.contentView.topAnchor,     constant: 65),
            topicCommentsView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 91),
        ])
    }
}

extension TopicCell: TopicCellViewModelViewDelegate{
    func didFetchImage() {
        UIView.animate(withDuration: 3) {
            self.topicLabel.alpha = 1
            self.topicImage.alpha = 1
            self.topicCommentsView.alpha = 1
        }
        
        if let image = viewModel?.image{
            topicImage.image = UIImage(data: image)
        }
        setNeedsLayout()
    }
}
