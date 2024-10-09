//
//  MVDBSignUpPresenter.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 23/09/24.
//

import UIKit

final class MVDBSignUpNamePresenter: MVDBSignUpPresenterInputProtocol {
    weak var view: MVDBSignUpPresenterOutputProtocol?
    private let interactor: MVDBSignUpInteractorInputProtocol
    private let router: MVDBSignUpRouterProtocol
    private var signUpStep: SignUpStep?
    
    init(interactor: MVDBSignUpInteractorInputProtocol, router: MVDBSignUpRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewWillAppear(view: MVDBSignUpPresenterOutputProtocol, leftSelector: Selector, rightSelector: Selector) {
        guard let view = view as? UIViewController,
              let navigationController = view.navigationController as? MVDBUINavigationController,
              let currentStep = signUpStep else { return }
        navigationController.navigationBar.isHidden = false
        let progress = interactor.updateProgressState(currentStep: currentStep)
        navigationController.setCustomNavigationItems(progress: progress, 
                                                      sender: view,
                                                      leftSelector: leftSelector,
                                                      rightSelector: rightSelector)
    }
    
    func viewDidLoad() {
        interactor.getCopiesForView()
    }
    
    func viewWillDisappear() {
        guard let signUpStep = signUpStep else { return }
        let previousStep = interactor.proceedToPreviousStep(currentStep: signUpStep)
        self.signUpStep = previousStep
    }
    
    func initializeNextStep() {
        guard let signUpStep = signUpStep else { return }
        let currentStep = interactor.proceedToNextStep(currentStep: signUpStep)
        self.signUpStep = currentStep
        let signUpModule = MVDBSignUpNameRouter.createSignUpModule(for: currentStep)
        router.pushView(from: view, to: signUpModule)
    }
    
    func goBack() {
        guard let currentStep = signUpStep else { return }
        router.popView(view: view, toSignUpStep: currentStep)
    }
    
    func help() {
        let helpModule = MVDBHelpRouter.createHelpModule()
        router.presentView(from: view, to: helpModule)
    }
}

extension MVDBSignUpNamePresenter: MVDBSignUpInteractorOutputProtocol {
    func didObtainCopiesForView(with copies: (title: String, description: String, textFieldPlaceholder: [String], termsText: String), and signUpStep: SignUpStep) {
        self.signUpStep = signUpStep
        view?.displayCopiesForView(screenTitle: copies.title,
                                   screenDescription: copies.description,
                                   textFieldPlaceholder: copies.textFieldPlaceholder,
                                   termsText: copies.termsText,
                                   signUpStep: signUpStep)
    }
}
