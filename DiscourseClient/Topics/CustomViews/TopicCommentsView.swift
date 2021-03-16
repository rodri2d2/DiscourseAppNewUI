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
    private var commentLabel: UILabel!
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
    private func getUIImageView(imageName: String, width: CGFloat, height: CGFloat) -> UIImageView {
        let view = UIImageView(frame: CGRect(x: .zero, y: .zero, width: width, height: height))
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.image = UIImage(named: imageName)
        return view
    }
    
    private func getUILabel(fontSize: CGFloat, labelText: String) -> UILabel {
        let view = UILabel()
        view.font.withSize(fontSize)
        view.text = labelText
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }
    
    
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
        self.commentLabel = baseLabel
        commentLabel.text = "24"
        //
        let commentStack = childStack
        commentStack.addArrangedSubview(imageView)
        commentStack.addArrangedSubview(commentLabel)
        mainStack.addArrangedSubview(commentStack)
    }
    
    private func setupUsersStack(){
        //
        let imageView   = baseImageView
        imageView.image = UIImage(named: "icoViewsSmall")
        //
        self.usersLabel = baseLabel
        usersLabel.text = "102"
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
        dateLabel.text = "Jul 23"
        //
        let createdDateStack = childStack
        createdDateStack.addArrangedSubview(imageView)
        createdDateStack.addArrangedSubview(dateLabel)
        mainStack.addArrangedSubview(createdDateStack)
    }
    
}
