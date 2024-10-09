//
//  MVDBSignUpViewController.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 23/09/24.
//

import UIKit

final class MVDBSignUpNameViewController: UIViewController {
    
    private let presenter: MVDBSignUpPresenterInputProtocol
    private var mainView: MVDBSignUpUIView?
    
    override func loadView() {
        mainView = MVDBSignUpUIView()
        mainView?.delegate = self
        self.view = mainView
    }
    
    init(presenter: MVDBSignUpPresenterInputProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear(view: self, leftSelector: #selector(backButtonTapped), rightSelector: #selector(rightBarButtonTapped))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.viewWillDisappear()
    }
    
    @objc
    private func backButtonTapped() {
        presenter.goBack()
    }
    
    @objc
    private func rightBarButtonTapped() {
        presenter.help()
    }

}

extension MVDBSignUpNameViewController: MVDBSignUpPresenterOutputProtocol {
    func displayCopiesForView(screenTitle: String, screenDescription: String, textFieldPlaceholder: [String], termsText: String, signUpStep: SignUpStep) {
        mainView?.configure(titleText: screenTitle,
                            descriptionText: screenDescription,
                            termsText: termsText,
                            placeholderText: textFieldPlaceholder.first ?? "",
                            secondPlaceholderText: textFieldPlaceholder.last ?? "",
                            signUpStep: signUpStep)
    }
}

extension MVDBSignUpNameViewController: MVDBSignUpNameUIViewDelegate {
    func didTapNextViewButton() {
        presenter.initializeNextStep()
    }
}
