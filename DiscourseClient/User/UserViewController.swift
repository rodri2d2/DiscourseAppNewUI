//
//  UserViewController.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 28/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    let viewModel: UserViewModel

    lazy var labelUserID: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var userIDStackView: UIStackView = {
        let labelUserIDTitle = UILabel()
        labelUserIDTitle.translatesAutoresizingMaskIntoConstraints = false
        labelUserIDTitle.text = NSLocalizedString("User ID: ", comment: "")
        labelUserIDTitle.textColor = .black

        let topicIDStackView = UIStackView(arrangedSubviews: [labelUserIDTitle, labelUserID])
        topicIDStackView.translatesAutoresizingMaskIntoConstraints = false
        topicIDStackView.axis = .horizontal

        return topicIDStackView
    }()

    lazy var labelUserName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var userNameUsingLabelStackView: UIStackView = {
        let labelUserIDTitle = UILabel()
        labelUserIDTitle.translatesAutoresizingMaskIntoConstraints = false
        labelUserIDTitle.text = NSLocalizedString("User name: ", comment: "")
        labelUserIDTitle.textColor = .black

        let topicIDStackView = UIStackView(arrangedSubviews: [labelUserIDTitle, labelUserName])
        topicIDStackView.translatesAutoresizingMaskIntoConstraints = false
        topicIDStackView.axis = .horizontal

        return topicIDStackView
    }()

    lazy var labelUsername: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var usernameStackView: UIStackView = {
        let labelUserIDTitle = UILabel()
        labelUserIDTitle.translatesAutoresizingMaskIntoConstraints = false
        labelUserIDTitle.text = NSLocalizedString("Username: ", comment: "")
        labelUserIDTitle.textColor = .black

        let topicIDStackView = UIStackView(arrangedSubviews: [labelUserIDTitle, labelUsername])
        topicIDStackView.translatesAutoresizingMaskIntoConstraints = false
        topicIDStackView.axis = .horizontal

        return topicIDStackView
    }()

    lazy var updateNameButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Update Name", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(updateNameButtonTapped), for: .touchUpInside)
        return button
    }()

    lazy var textFieldUserName: UITextField = {
        let textFieldUserName = UITextField()
        textFieldUserName.borderStyle = .line
        textFieldUserName.translatesAutoresizingMaskIntoConstraints = false
        return textFieldUserName
    }()

    lazy var userNameUsingTextFieldStackView: UIStackView = {
        let labelUserIDTitle = UILabel()
        labelUserIDTitle.translatesAutoresizingMaskIntoConstraints = false
        labelUserIDTitle.text = NSLocalizedString("User name: ", comment: "")
        labelUserIDTitle.textColor = .black

        let topicIDStackView = UIStackView(arrangedSubviews: [labelUserIDTitle, textFieldUserName])
        topicIDStackView.translatesAutoresizingMaskIntoConstraints = false
        topicIDStackView.axis = .horizontal
        topicIDStackView.distribution = .fillEqually

        return topicIDStackView
    }()

    lazy var labelOrTextFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userNameUsingTextFieldStackView, userNameUsingLabelStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()

    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        view.addSubview(userIDStackView)
        NSLayoutConstraint.activate([
            userIDStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            userIDStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])

        view.addSubview(labelOrTextFieldStackView)
        NSLayoutConstraint.activate([
            labelOrTextFieldStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            labelOrTextFieldStackView.topAnchor.constraint(equalTo: userIDStackView.bottomAnchor, constant: 8)
        ])

        view.addSubview(usernameStackView)
        NSLayoutConstraint.activate([
            usernameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            usernameStackView.topAnchor.constraint(equalTo: userNameUsingLabelStackView.bottomAnchor, constant: 8)
        ])

        view.addSubview(updateNameButton)
        NSLayoutConstraint.activate([
            updateNameButton.topAnchor.constraint(equalTo: usernameStackView.bottomAnchor, constant: 8),
            updateNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewWasLoaded()
    }

    fileprivate func updateUI() {
        UIView.animate(withDuration: 0.25) { [weak self] in
            guard let self = self else { return }
            self.labelUserID.text = self.viewModel.userIDLabelText
            self.labelUserName.text = self.viewModel.nameLabelText
            self.labelUsername.text = self.viewModel.username
            self.userNameUsingTextFieldStackView.isHidden = self.viewModel.userNameUsingTextFieldStackViewIsHidden
            self.userNameUsingLabelStackView.isHidden = !self.viewModel.userNameUsingTextFieldStackViewIsHidden
            self.updateNameButton.isHidden = self.viewModel.updateNameButtonIsHidden
        }
    }

    fileprivate func showErrorFetchingUser() {
        showAlert("Error fetching user\nPlease try again later")
    }

    fileprivate func showSuccessUpdatingUserName() {
        showAlert("The user name has been successfully updated!", "Success!", "OK")
    }

    fileprivate func showErrorUpdatingUserName() {
        showAlert("Error updating user name\nPlease try again later")
    }

    @objc func updateNameButtonTapped() {
        guard let name = textFieldUserName.text, !name.isEmpty else { return }
        viewModel.updateNameButtonTapped(name: name)
    }
}

extension UserViewController: UserViewModelViewDelegate {
    func errorFetchingUser() {
        showErrorFetchingUser()
    }

    func userDataFetched() {
        updateUI()
    }

    func successUpdatingUserName() {
        showSuccessUpdatingUserName()
    }

    func errorUpdatingUserName() {
        showErrorUpdatingUserName()
    }
}
