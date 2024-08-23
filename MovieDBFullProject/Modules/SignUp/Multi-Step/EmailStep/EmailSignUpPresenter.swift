//
//  EmailSignUpPresenter.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/02/24.
//

import UIKit

final class EmailSignUpPresenter: ViewToPresenterEmailSignUpProtocol {
    
    private let interactor: PresenterToInteractorEmailSignUpProtocol
    private let router: PresenterToRouterEmailSignUpProtocol
    
    init(interactor: PresenterToInteractorEmailSignUpProtocol, 
         router: PresenterToRouterEmailSignUpProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func saveEmail(email: String?) {
        interactor.saveEmail(email: email)
    }
    
    func navigateToThirdStep(with navigationController: UINavigationController) {
        router.createThirdStepModule(navigationController: navigationController)
    }
}
