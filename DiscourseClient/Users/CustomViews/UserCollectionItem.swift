//
//  UserItem.swift
//  DiscourseClient
//
//  Created by Rodrigo  Candido on 19/3/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

class UserCollectionItem: UIView {

    // MARK: - Outlets
    private lazy var containerView: UIView = {
        let view = UIView(frame: self.frame)
        return view
    }()
    
    private lazy var itemImage: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.alpha = 0
        return view
    }()
    
    private lazy var itemLabel: UILabel = {
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
    

    // MARK: - Class functionalities UI related
    private func setupOutlets(){
        setupContentView()
        setupItemImage()
        setupItemLabel()

    }
    
    private func setupContentView(){
        addSubview(self.containerView)
        self.containerView.pin(to: self)
    }
    
    private func setupItemImage(){
        self.containerView.addSubview(itemImage)
        self.itemImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            itemImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 7),
            itemImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -7)
            
        ])
    }
    
    private func setupItemLabel(){
        self.containerView.addSubview(itemLabel)
        self.itemLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemLabel.topAnchor.constraint(equalTo: itemImage.bottomAnchor, constant: 9),
            itemLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            itemLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor)
        ])
    }
    
    func updateImage(image: UIImage){
        self.itemImage.image = image
        if let radius = itemImage.image?.size.height {
            self.itemImage.layer.cornerRadius = radius / 2
            UIView.animate(withDuration: 2) {
                self.itemImage.alpha = 1
            }
            
        }
        
        setNeedsLayout()
    }
    
    func updateText(text: String){

            self.itemLabel.text = text
        UIView.animate(withDuration: 2) {
            self.itemLabel.alpha = 1
        }
        
        setNeedsLayout()
    }
    
    
    func prepareForReuse(){
        self.itemImage.image = nil
        self.itemLabel.text = nil
    }
}
