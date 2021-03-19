//
//  TopicCommentsView.swift
//  DiscourseClient
//
//  Created by Rodrigo  Candido on 15/3/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

class TopicCommentsView: UIView {
    
    // MARK: - Outlets
    private var postsLabel:   UILabel!
    private var usersLabel:   UILabel!
    private var dateLabel:    UILabel!
    
    private lazy var contentView: UIView = {
        let view = UIView(frame: self.frame)
        return view
    }()
    
    private let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.spacing = 6
        return stack
    }()
    
    private let childStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.alignment    = .fill
        stack.axis         = .horizontal
        stack.spacing      = 4
        return stack
    }()
    
    private var baseLabel: UILabel {
        let view = UILabel()
        view.font.withSize(12)
        view.textColor = .discourseGray
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }
    
    private var baseImageView: UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupContentView()
        setupOutlets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Class functionalities
    private func setupOutlets(){
        setupCommentsStack()
        setupUsersStack()
        setupDateStack()
    }
    
    private func setupContentView(){
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.frame = contentView.bounds
    }
    
    private func setupCommentsStack(){
        //
        let imageView = baseImageView
        imageView.image = UIImage(named: "icoSmallAnswers")
        //
        self.postsLabel = baseLabel
        //
        let commentStack = childStack
        commentStack.addArrangedSubview(imageView)
        commentStack.addArrangedSubview(postsLabel)
        mainStack.addArrangedSubview(commentStack)
    }
    
    private func setupUsersStack(){
        //
        let imageView   = baseImageView
        imageView.image = UIImage(named: "icoViewsSmall")
        //
        self.usersLabel = baseLabel
        //
        let usersStack  = childStack
        usersStack.addArrangedSubview(imageView)
        usersStack.addArrangedSubview(usersLabel)
        mainStack.addArrangedSubview(usersStack)
        
    }
    
    private func setupDateStack(){
        //
        let imageView = baseImageView
        imageView.image = UIImage(named: "icoSmallCalendar")
        //
        self.dateLabel = baseLabel
        //
        let createdDateStack = childStack
        createdDateStack.addArrangedSubview(imageView)
        createdDateStack.addArrangedSubview(dateLabel)
        mainStack.addArrangedSubview(createdDateStack)
    }
    
    func updateViewItems(numberOfPosts: String, usersByPost: String, createdAt: String){
        self.postsLabel.text = numberOfPosts
        self.usersLabel.text = usersByPost
        self.dateLabel.text  = createdAt
    }
    
}
