//
//  EmailSignUpInteractor.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/02/24.
//

import Foundation

final class EmailSignUpInteractor: PresenterToInteractorEmailSignUpProtocol {
    func saveEmail(email: String?) {
        guard let email = email else { return }
        SignUpEntity.shared.email = email
    }
}
