//
//  MVDBLobbyProtocols.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 20/09/24.
//

import UIKit

// MARK: - UIView
protocol MVDBLobbyUIViewDelegate: AnyObject {
    func didTapSignInButton()
    func didTapSignUpButton()
}

// MARK: - View -> Presenter
protocol MVDBLobbyPresenterInputProtocol: AnyObject {
    var view: MVDBLobbyPresenterOutputProtocol? { get set }
    func viewDidLoad()
    func initializeSignUpModule()
}

// MARK: - Presenter -> View
protocol MVDBLobbyPresenterOutputProtocol: AnyObject {
    func displayLobbyStrings(title: String, description: String, signInButton: String, signUp: String)
}

// MARK: - Presenter -> Interactor
protocol MVDBLobbyInteractorInputProtocol: AnyObject {
    var presenter: MVDBLobbyInteractorOutputProtocol? { get set }
    func getLobbyStrings()
}

// MARK: - Interactor -> Presenter
protocol MVDBLobbyInteractorOutputProtocol: AnyObject {
    func didObtainedLobbyStrings(with data: (lobbyTitle: String, lobbyDescription: String, lobbySignInButton: String, lobbySignUpButton: String))
}

// MARK: - Router
protocol MVDBLobbyRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    static func createLobbyModule() -> UIViewController
    func createSignUpModule(from view: MVDBLobbyPresenterOutputProtocol?, to viewToPresent: UIViewController)
}

