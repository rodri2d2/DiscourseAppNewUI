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
            topicLabel.text = viewModel.textLabelText
            if let image = UIImage(named: "avatar"){
                self.topicImage.image = UIImage(named: "avatar")
                self.topicImage.layer.cornerRadius = image.size.height / 2
            }
        }
    }
    
    // MARK: - Outlets
    lazy var topicLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 17)
        view.numberOfLines = 2
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    lazy var topicImage: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var topicCommentsView: TopicCommentsView = {
        let view = TopicCommentsView()
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
