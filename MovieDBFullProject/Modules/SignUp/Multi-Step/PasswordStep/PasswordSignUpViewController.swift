//
//  PasswordSignUpViewController.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/02/24.
//

import UIKit

final class PasswordSignUpViewController: BaseSignUpViewController {
    
    private let presenter: ViewToPresenterPasswordSignUpProtocol
    
    init(presenter: ViewToPresenterPasswordSignUpProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signUpStep = .password
        setupView()
    }
    
    override func continueNextView() {
        presenter.savePassword(password: self.getDataTextFieldText,
                               confirmPassword: self.getSecondDataTextFieldText)
        presenter.finishSigningUp()
    }
    
    private func setupView() {
        self.configure(titleText: "Create your password",
                       descriptionText: "Create your password to continue to create your account",
                       placeholderText: "Create your password",
                       needsSecondTextField: true,
                       secondPlaceholderText: "Confirm your password")
    }

}
