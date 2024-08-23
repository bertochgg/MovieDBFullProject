//
//  OnboardingPresenter.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 04/10/23.
//

import UIKit

final class OnboardingPresenter: ViewToPresenterOnboardingProtocol {
    private let router: PresenterToRouterOnboardingProtocol
    
    init(router: PresenterToRouterOnboardingProtocol) {
        self.router = router
    }
    
    func signInButtonTapped() {
        
    }
    
    func signUpButtonTapped(with navigationController: UINavigationController) {
        router.createSignUpModule(with: navigationController)
    }
}
