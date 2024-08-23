//
//  EmailSignUpProtocols.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/02/24.
//

import UIKit

// View
protocol ViewToPresenterEmailSignUpProtocol: AnyObject {
    func saveEmail(email: String?)
    func navigateToThirdStep(with navigationController: UINavigationController)
}

// Interactor
protocol PresenterToInteractorEmailSignUpProtocol: AnyObject {
    func saveEmail(email: String?)
}

// Router
protocol PresenterToRouterEmailSignUpProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    
    static func createModule() -> UIViewController
    func createThirdStepModule(navigationController: UINavigationController)
}
