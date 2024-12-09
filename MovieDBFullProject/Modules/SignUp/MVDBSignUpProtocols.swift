//
//  MVDBSignUpProtocols.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 23/09/24.
//

import UIKit

// MARK: - UIView -> Controller
protocol MVDBSignUpNameUIViewDelegate: AnyObject {
    func didTapNextViewButton(with data: String)
    func showSecondDataTextField(textField: UITextField, placeholder: String)
    func configureViewByStep(firstTextField: MVDBTextField, secondTextField: MVDBTextField, imageView: UIImageView, selectorForHelper: Selector, selectorForShowFirst: Selector, selectorForShowSecond: Selector, target: Any)
}

// MARK: - Controller -> Presenter
protocol MVDBSignUpPresenterInputProtocol: AnyObject {
    var view: MVDBSignUpPresenterOutputProtocol? { get set }
    func viewWillAppear(view: MVDBSignUpPresenterOutputProtocol, leftSelector: Selector, rightSelector: Selector)
    func viewDidLoad()
    func viewWillDisappear()
    func initializeNextStep(with data: String)
    func goBack()
    func help()
}

// MARK: - Presenter -> Controller
protocol MVDBSignUpPresenterOutputProtocol: AnyObject {
    func displayCopiesForView(screenTitle: String, screenDescription: String, textFieldPlaceholder: [String], termsText: String, signUpStep: SignUpStep, target: Any, selectorForAction: Selector)
}

// MARK: - Presenter -> Interactor
protocol MVDBSignUpInteractorInputProtocol: AnyObject {
    var presenter: MVDBSignUpInteractorOutputProtocol? { get set }
    var isPasswordStep: Bool { get }
    var currentStep: SignUpStep { get }
    func getCopiesForView()
    func proceedToNextStep(currentStep: SignUpStep) -> SignUpStep?
    func proceedToNextStepWithData(data: String, currentStep: SignUpStep)
    func proceedToPreviousStepDeletingData(currentStep: SignUpStep)
    func proceedToPreviousStep(currentStep: SignUpStep) -> SignUpStep
    func updateProgressState(currentStep: SignUpStep) -> Float
}

// MARK: - Interactor -> Presenter
protocol MVDBSignUpInteractorOutputProtocol: AnyObject {
    func didObtainCopiesForView(with copies: (title: String, description: String, textFieldPlaceholder: [String], termsText: String), and signUpStep: SignUpStep)
}

// MARK: - Interactor -> RemoteDataManager
protocol MVDBSignUpRemoteDataManagerInputProtocol: AnyObject {
    
}

protocol MVDBSignUpRemoteDataManagerOutputProtocol: AnyObject {
    func didFetchDataWith(success data: MVDBSignUpEntity?)
    func didFetchDataWith(failure error: Error?)
}

// MARK: - Router
protocol MVDBSignUpRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    static func createSignUpModule(for signUpStep: SignUpStep) -> UIViewController
    func popView(view: MVDBSignUpPresenterOutputProtocol?, toSignUpStep: SignUpStep)
    func pushView(from view: MVDBSignUpPresenterOutputProtocol?, to viewToPresent: UIViewController)
    func presentViewModally(from view: MVDBSignUpPresenterOutputProtocol?, to viewToPresent: UIViewController)
    func presentView(from view: MVDBSignUpPresenterOutputProtocol?, to viewToPresent: UIViewController)
}
