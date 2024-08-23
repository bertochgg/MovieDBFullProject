//
//  NameSignUpViewController.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/02/24.
//

import UIKit

final class NameSignUpViewController: BaseSignUpViewController {
    private let presenter: ViewToPresenterNameSignUpProtocol
    
    init(presenter: ViewToPresenterNameSignUpProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signUpStep = .name
        view.backgroundColor = .black
        setupView()
    }
    
    override func continueNextView() {
        guard let navigationController = navigationController else { return }
        presenter.saveName(name: self.getDataTextFieldText,
                           lastName: self.getSecondDataTextFieldText)
        presenter.navigateSecondStep(with: navigationController)
    }
    
    private func setupView() {
        self.configure(titleText: "What's your name",
                       descriptionText: "Enter your name to continue to create to your account",
                       placeholderText: "Enter your name",
                       needsSecondTextField: true,
                       secondPlaceholderText: "Enter your last name")
    }

}
