//
//  MVDBSignUpProtocols.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 23/09/24.
//

import UIKit

// MARK: - UIView
protocol MVDBSignUpNameUIViewDelegate: AnyObject {
    func didTapNextViewButton()
}

// MARK: - View -> Presenter
protocol MVDBSignUpPresenterInputProtocol: AnyObject {
    var view: MVDBSignUpPresenterOutputProtocol? { get set }
    func viewWillAppear(view: MVDBSignUpPresenterOutputProtocol, leftSelector: Selector, rightSelector: Selector)
    func viewDidLoad()
    func viewWillDisappear()
    func initializeNextStep()
    func goBack()
    func help()
}

// MARK: - Presenter -> View
protocol MVDBSignUpPresenterOutputProtocol: AnyObject {
    func displayCopiesForView(screenTitle: String, screenDescription: String, textFieldPlaceholder: [String], termsText: String, signUpStep: SignUpStep)
}

// MARK: - Presenter -> Interactor
protocol MVDBSignUpInteractorInputProtocol: AnyObject {
    var presenter: MVDBSignUpInteractorOutputProtocol? { get set }
    func getCopiesForView()
    func proceedToNextStep(currentStep: SignUpStep) -> SignUpStep
    func proceedToPreviousStep(currentStep: SignUpStep) -> SignUpStep
    func updateProgressState(currentStep: SignUpStep) -> Float
}

// MARK: - Interactor -> Presenter
protocol MVDBSignUpInteractorOutputProtocol: AnyObject {
    func didObtainCopiesForView(with copies: (title: String, description: String, textFieldPlaceholder: [String], termsText: String), and signUpStep: SignUpStep)
}

// MARK: - Router
protocol MVDBSignUpRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    static func createSignUpModule(for signUpStep: SignUpStep) -> UIViewController
    func popView(view: MVDBSignUpPresenterOutputProtocol?, toSignUpStep: SignUpStep)
    func pushView(from view: MVDBSignUpPresenterOutputProtocol?, to viewToPresent: UIViewController)
    func presentView(from view: MVDBSignUpPresenterOutputProtocol?, to viewToPresent: UIViewController)
}
