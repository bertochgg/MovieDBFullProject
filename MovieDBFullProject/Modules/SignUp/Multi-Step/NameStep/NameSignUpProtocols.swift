//
//  NameSignUpProtocols.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/02/24.
//

import UIKit

// View
protocol ViewToPresenterNameSignUpProtocol: AnyObject {
    func saveName(name: String?, lastName: String?)
    func navigateSecondStep(with navigationController: UINavigationController)
}

// Interactor
protocol PresenterToInteractorNameSignUpProtocol: AnyObject {
    func saveName(name: String?, lastName: String?)
}

// Router
protocol PresenterToRouterNameSignUpProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    
    static func createModule() -> UIViewController
    func createSecondStepModule(navigationController: UINavigationController)
}
