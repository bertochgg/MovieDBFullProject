//
//  PasswordSignUpPresenter.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 01/03/24.
//

import Foundation

final class PasswordSignUpPresenter: ViewToPresenterPasswordSignUpProtocol {
    
    private let interactor: PresenterToInteractorPasswordSignUpProtocol
    private let router: PresenterToRouterPasswordSignUpProtocol
    
    init(interactor: PresenterToInteractorPasswordSignUpProtocol, router: PresenterToRouterPasswordSignUpProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func savePassword(password: String?, confirmPassword: String?) {
        interactor.savePassword(password: password, confirmPassword: password)
    }
    
    func finishSigningUp() {
        router.createMainModule()
        print(SignUpEntity.shared.firstName, SignUpEntity.shared.lastName, SignUpEntity.shared.email, SignUpEntity.shared.password)
    }
}
