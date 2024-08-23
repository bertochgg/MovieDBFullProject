//
//  EmailSignUpRouter.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 29/02/24.
//

import UIKit

final class EmailSignUpRouter: PresenterToRouterEmailSignUpProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        
        let interactor: PresenterToInteractorEmailSignUpProtocol = EmailSignUpInteractor()
        let router: PresenterToRouterEmailSignUpProtocol = EmailSignUpRouter()
        let presenter: ViewToPresenterEmailSignUpProtocol = EmailSignUpPresenter(interactor: interactor, router: router)
        
        let view = EmailSignUpViewController(presenter: presenter)
        router.viewController = view
        
        return view
    }
    
    func createThirdStepModule(navigationController: UINavigationController) {
        let thirdStep = PasswordSignUpRouter.createModule()
        navigationController.pushViewController(thirdStep, animated: true)
    }
}
