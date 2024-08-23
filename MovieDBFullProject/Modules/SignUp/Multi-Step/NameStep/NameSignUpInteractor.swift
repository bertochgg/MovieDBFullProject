//
//  NameSignUpInteractor.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/02/24.
//

import Foundation

final class NameSignUpInteractor: PresenterToInteractorNameSignUpProtocol {
    func saveName(name: String?, lastName: String?) {
        guard let firstName = name, let lastName = lastName else { return }
        SignUpEntity.shared.firstName = firstName
        SignUpEntity.shared.lastName = lastName
    }
}
