//
//  UsersViewController.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 28/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    let viewModel: UsersViewModel
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate   = self
        view.dataSource = self
        view.register(UsersCollectionCell.self, forCellWithReuseIdentifier: UsersCollectionCell.description())
        view.backgroundColor = .white
        return view
        
    }()
    
    
    init(viewModel: UsersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .discourseWhite
        view.addSubview(collectionView)
        collectionView.pinWintSafety(to: view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewWasLoaded()
        setupNavigationBar()
    }
    
    fileprivate func showErrorFetchingUsers() {
        showAlert("Error fetching users\nPlease try again later")
    }
    
    fileprivate func setupNavigationBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isTranslucent      = true
        self.navigationController?.navigationBar.isOpaque           = true
        self.navigationController?.navigationBar.backgroundColor    = UIColor.discourseWhite
        
        //Navigation Bar Shadow related
        self.navigationController?.navigationBar.layer.shadowRadius  = 1
        self.navigationController?.navigationBar.layer.shadowOffset  = CGSize(width: 0, height: 2)
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.3
        self.navigationController?.navigationBar.layer.shadowColor   = UIColor.discourseGray.cgColor
    }
    
}


// MARK: - Extention for UsersViewModelViewDelegate
extension UsersViewController: UsersViewModelViewDelegate {
    func usersWereFetched() {
        collectionView.reloadData()
    }
    
    func errorFetchingUsers() {
        showErrorFetchingUsers()
    }
}


// MARK: - Extension for UICollectionViewDataSource
extension UsersViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UsersCollectionCell.description(), for: indexPath) as! UsersCollectionCell
        let cellViewModel = viewModel.viewModel(at: indexPath)
        cell.viewModel = cellViewModel
        return cell
    }
}

// MARK: - Extention for UICollectionViewDelegateFlowLayout
extension UsersViewController: UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
    }
    
    //Collection cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 94, height: 124)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: CGFloat(24), left: CGFloat(26), bottom: 0, right: CGFloat(26))
    }
    
    //Collection cell spaces between one cell and another
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(34.5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(18)
    }
}
