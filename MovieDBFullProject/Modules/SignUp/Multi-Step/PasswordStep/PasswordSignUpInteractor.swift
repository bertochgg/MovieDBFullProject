//
//  PasswordSignUpInteractor.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 01/03/24.
//

import Foundation

final class PasswordSignUpInteractor: PresenterToInteractorPasswordSignUpProtocol {
    func savePassword(password: String?, confirmPassword: String?) {
        guard let password = password, let confirmPassword = confirmPassword else { return }
        if isPasswordEqual(password: password, confirmPassword: confirmPassword) {
            SignUpEntity.shared.password = password
        }
    }
    
    private func isPasswordEqual(password: String?, confirmPassword: String?) -> Bool {
        return password == confirmPassword
    }
}
