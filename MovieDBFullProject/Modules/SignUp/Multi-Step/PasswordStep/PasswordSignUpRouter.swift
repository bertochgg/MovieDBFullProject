//
//  PasswordSignUpRouter.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 01/03/24.
//

import UIKit

final class PasswordSignUpRouter: PresenterToRouterPasswordSignUpProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let interactor: PresenterToInteractorPasswordSignUpProtocol = PasswordSignUpInteractor()
        let router: PresenterToRouterPasswordSignUpProtocol = PasswordSignUpRouter()
        let presenter: ViewToPresenterPasswordSignUpProtocol = PasswordSignUpPresenter(interactor: interactor, router: router)
        
        let view = PasswordSignUpViewController(presenter: presenter)
        router.viewController = view
        
        return view
    }
    
    func createMainModule() {
        print("finished")
    }
}

