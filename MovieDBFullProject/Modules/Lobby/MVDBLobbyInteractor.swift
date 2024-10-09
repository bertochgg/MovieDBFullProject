//
//  MVDBLobbyInteractor.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 20/09/24.
//

import Foundation

final class MVDBLobbyInteractor: MVDBLobbyInteractorInputProtocol {
    weak var presenter: MVDBLobbyInteractorOutputProtocol?
    private let lobbyEntity: MVDBLobbyEntity
    
    init(lobbyEntity: MVDBLobbyEntity) {
        self.lobbyEntity = lobbyEntity
    }
    
    func getLobbyStrings() {
        let lobbyStrings = (lobbyTitle: lobbyEntity.lobbyTitle,
                           lobbyDescription: lobbyEntity.lobbyDescription,
                           lobbySignInButton: lobbyEntity.lobbySignInButton,
                           lobbySignUpButton: lobbyEntity.lobbySignUpButton)
        presenter?.didObtainedLobbyStrings(with: lobbyStrings)
    }
    
}
