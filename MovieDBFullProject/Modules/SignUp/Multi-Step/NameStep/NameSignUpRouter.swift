//
//  NameSignUpRouter.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/02/24.
//

import UIKit

final class NameSignUpRouter: PresenterToRouterNameSignUpProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let router: PresenterToRouterNameSignUpProtocol = NameSignUpRouter()
        let interactor: PresenterToInteractorNameSignUpProtocol = NameSignUpInteractor()
        let presenter: ViewToPresenterNameSignUpProtocol = NameSignUpPresenter(interactor: interactor, router: router)
        
        let view = NameSignUpViewController(presenter: presenter)
        router.viewController = view
        
        return view
    }
    
    func createSecondStepModule(navigationController: UINavigationController) {
        let secondStep = EmailSignUpRouter.createModule()
        navigationController.pushViewController(secondStep, animated: true)
    }
    
}

