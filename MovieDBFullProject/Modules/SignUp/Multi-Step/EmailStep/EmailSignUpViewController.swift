//
//  EmailSignUpViewController.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/02/24.
//

import UIKit

final class EmailSignUpViewController: BaseSignUpViewController {
    
    private let presenter: ViewToPresenterEmailSignUpProtocol
    
    init(presenter: ViewToPresenterEmailSignUpProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signUpStep = .email
        setupView()
    }

    override func continueNextView() {
        guard let navigationController = navigationController else { return }
        presenter.saveEmail(email: self.getDataTextFieldText)
        presenter.navigateToThirdStep(with: navigationController)
    }
    
    private func setupView() {
        self.configure(titleText: "Enter your email",
                       descriptionText: "Enter your email to continue to create to your account",
                       placeholderText: "Enter your email",
                       needsSecondTextField: false)
    }
}
