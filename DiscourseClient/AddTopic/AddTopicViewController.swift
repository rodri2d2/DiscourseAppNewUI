//
//  AddTopicViewController.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// ViewController representando un formulario de entrada para crear un topic
class AddTopicViewController: UIViewController {
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .line
        textField.placeholder = NSLocalizedString("Insert topic title and tap Submit", comment: "")

        return textField
    }()

    let viewModel: AddTopicViewModel

    init(viewModel: AddTopicViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        view.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])


        setupNavigationBarButtons()

    }

    // MARK: - Actions
    @objc fileprivate func cancelButtonTapped() {
        viewModel.cancelButtonTapped()
    }

    @objc fileprivate func submitButtonTapped() {
        guard let text = textField.text, !text.isEmpty else { return }
        viewModel.submitButtonTapped(title: text)
    }

    // MARK: - Class functionalities
    fileprivate func showErrorAddingTopicAlert() {
        let message = NSLocalizedString("Error adding topic\nPlease try again later", comment: "")
        showAlert(message)
    }
    
    private func setupNavigationBarButtons(){
        setupLeftButton()
        setupRightButton()
    }
    
    private func setupLeftButton(){
        let leftBarButton: UIBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        leftBarButton.tintColor = .pumpkin
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    private func setupRightButton(){
        let rightBarButton: UIBarButtonItem = UIBarButtonItem(title: "Publish", style: .plain, target: self, action: #selector(submitButtonTapped))
        rightBarButton.tintColor = .pumpkin
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
}

extension AddTopicViewController: AddTopicViewDelegate {
    func errorAddingTopic() {
        showErrorAddingTopicAlert()
    }
}
