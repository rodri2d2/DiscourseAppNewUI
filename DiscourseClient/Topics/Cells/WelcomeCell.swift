//
//  WelcomeCell.swift
//  DiscourseClient
//
//  Created by Rodrigo  Candido on 19/3/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

class WelcomeCell: UITableViewCell {
    
    // MARK: - Class properties
    var viewModel: WelcomeCellViewModel? {
        didSet{
            self.titleLabel.text = viewModel?.titleLabelText
            self.bodyLabel.text  = viewModel?.bodyLabelText ?? "The first paragraph of this pinned topic will be visible as a welcome message to all new visitors on your homepage. It’s important!"
        }
    }
    
    
    // MARK: - Outlets
    let containerView = UIView()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 22)
        view.numberOfLines = 1
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    lazy var bodyLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 17)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping
        return view
    }()

    lazy var pinImage: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.image = UIImage(named: "icoPin")
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupOutlets()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Class functionalities
    private func setupOutlets(){
        setupContainerView()
        setupPINImage()
        setupTitlelabel()
        setupBodyLabel()
    }
    
    private func setupContainerView(){
        self.contentView.backgroundColor = .black
        self.contentView.addSubview(containerView)
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            //Position constraints
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 25),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -25),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        
        ])
        self.containerView.layer.cornerRadius = 8
        self.containerView.backgroundColor = .tangerine
    }
    
    private func setupPINImage(){
        
        self.containerView.addSubview(pinImage)
        self.pinImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            //Position constraints
            pinImage.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 12),
            pinImage.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -16),
        
        ])
    }
    
    private func setupTitlelabel(){
        self.containerView.addSubview(titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            //Position constraints
            titleLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 9),
            titleLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -46)
        
        ])
    }
    
    
    private func setupBodyLabel(){
        
        self.containerView.addSubview(bodyLabel)
        self.bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            //Position constraints
            bodyLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 43),
            bodyLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -8),
            bodyLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 16),
            bodyLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -46)
            
        
        ])
        
    }
    

}
