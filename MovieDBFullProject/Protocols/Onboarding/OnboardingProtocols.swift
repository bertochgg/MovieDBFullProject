//
//  OnboardingProtocols.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 04/10/23.
//

import UIKit

// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterOnboardingProtocol: AnyObject {
    func signInButtonTapped()
    func signUpButtonTapped(with navigationController: UINavigationController)
}

// MARK: - View Output (Presenter -> View)
protocol PresenterToViewOnboardingProtocol: AnyObject {
    
}

// MARK: - Presenter To Router (Presenter -> Router)
protocol PresenterToRouterOnboardingProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    
    static func createOnboardingModule() -> UIViewController
    
//    func createSignInModule() -> UINavigationController
    func createSignUpModule(with navigationController: UINavigationController)
}
