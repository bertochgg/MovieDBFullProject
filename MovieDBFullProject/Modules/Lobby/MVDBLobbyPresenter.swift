//
//  MVDBLobbyPresenter.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 20/09/24.
//

import Foundation

final class MVDBLobbyPresenter: MVDBLobbyPresenterInputProtocol {
    weak var view: MVDBLobbyPresenterOutputProtocol?
    private let interactor: MVDBLobbyInteractorInputProtocol
    private let router: MVDBLobbyRouterProtocol
    
    init(interactor: MVDBLobbyInteractorInputProtocol, router: MVDBLobbyRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.getLobbyStrings()
    }
    
    func initializeSignUpModule() {
        let signUpNameModule = MVDBSignUpNameRouter.createSignUpModule(for: .name)
        router.createSignUpModule(from: view, to: signUpNameModule)
    }
}

extension MVDBLobbyPresenter: MVDBLobbyInteractorOutputProtocol {
    func didObtainedLobbyStrings(with data: (lobbyTitle: String, lobbyDescription: String, lobbySignInButton: String, lobbySignUpButton: String)) {
        view?.displayLobbyStrings(title: data.lobbyTitle, description: data.lobbyDescription, signInButton: data.lobbySignInButton, signUp: data.lobbySignUpButton)
    }
}
