//
//  OnboardingRouter.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 04/10/23.
//

import UIKit

final class OnboardingRouter: PresenterToRouterOnboardingProtocol {
    
    
    weak var viewController: UIViewController?
    
    static func createOnboardingModule() -> UIViewController {
        // Init dependencies
        let router: PresenterToRouterOnboardingProtocol = OnboardingRouter()
        let presenter: ViewToPresenterOnboardingProtocol = OnboardingPresenter(router: router)
        let view = OnboardingViewController(presenter: presenter)
        
        router.viewController = view
        
        return view
    }
    
//    func createSignInModule() -> UINavigationController {
//
//    }
//
    func createSignUpModule(with navigationController: UINavigationController) {
        let signUpModule = NameSignUpRouter.createModule()
        navigationController.pushViewController(signUpModule, animated: true)
    }
}
