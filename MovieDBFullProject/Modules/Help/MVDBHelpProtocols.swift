//
//  MVDBHelpProtocols.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 25/09/24.
//

import UIKit

// MARK: - UIView
protocol MVDBHelpUIViewDelegate: AnyObject {
    func didTapCallCustomerServiceButton()
}

// MARK: - View -> Presenter Input
protocol MVDBHelpPresenterInputProtocol: AnyObject {
    var view: MVDBHelpPresenterOutputProtocol? { get set }
    func viewDidLoad()
    func callCustomerService()
    func goBack()
}

// MARK: - Presenter -> View Ouput
protocol MVDBHelpPresenterOutputProtocol: AnyObject {
    func displayCopiesForView(title: String, description: String, buttonTitle: String)
}

// MARK: - Presenter -> Interactor Input
protocol MVDBHelpInteractorInputProtocol: AnyObject {
    var presenter: MVDBHelpInteractorOutputProtocol? { get set }
    func getCopiesForDesign()
}

// MARK: - Interactor -> Presenter Output
protocol MVDBHelpInteractorOutputProtocol: AnyObject {
    func didObtainedCopiesForView(with copies: (title: String, description: String, buttonTitle: String))
}

// MARK: - Router
protocol MVDBHelpRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    static func createHelpModule() -> UIViewController
    func popView(view: MVDBHelpPresenterOutputProtocol?)
    func presentAlert(from view: MVDBHelpPresenterOutputProtocol?, to alertToPresent: UIViewController)
}

