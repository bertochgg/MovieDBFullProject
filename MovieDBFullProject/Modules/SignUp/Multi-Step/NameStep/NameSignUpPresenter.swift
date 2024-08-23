//
//  NameSignUpPresenter.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/02/24.
//

import UIKit

final class NameSignUpPresenter: ViewToPresenterNameSignUpProtocol {
    
    private let interactor: PresenterToInteractorNameSignUpProtocol
    private let router: PresenterToRouterNameSignUpProtocol
    
    init(interactor: PresenterToInteractorNameSignUpProtocol, 
         router: PresenterToRouterNameSignUpProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func saveName(name: String?, lastName: String?) {
        interactor.saveName(name: name, lastName: lastName)
    }
    
    func navigateSecondStep(with navigationController: UINavigationController) {
        router.createSecondStepModule(navigationController: navigationController)
    }
}
