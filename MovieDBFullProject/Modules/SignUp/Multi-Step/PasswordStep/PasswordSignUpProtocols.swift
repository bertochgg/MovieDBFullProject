//
//  PasswordSignUpProtocols.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 01/03/24.
//

import UIKit

// View
protocol ViewToPresenterPasswordSignUpProtocol: AnyObject {
    func savePassword(password: String?, confirmPassword: String?)
    func finishSigningUp()
}

// Interactor
protocol PresenterToInteractorPasswordSignUpProtocol: AnyObject {
    func savePassword(password: String?, confirmPassword: String?)
}

// Router
protocol PresenterToRouterPasswordSignUpProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    
    static func createModule() -> UIViewController
    func createMainModule()
}
