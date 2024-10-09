//
//  MVDBSignUpRouter.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 23/09/24.
//

import UIKit

final class MVDBSignUpNameRouter: MVDBSignUpRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createSignUpModule(for signUpStep: SignUpStep) -> UIViewController {
        let interactor: MVDBSignUpInteractorInputProtocol = MVDBSignUpNameInteractor(signUpNameEntity: MVDBSignUpNameEntity(),
                                                                                     signUpEmailEntity: MVDBSignUpEmailEntity(),
                                                                                     signUpPasswordEntity: MVDBSignUpPasswordEntity(),
                                                                                     signUpStep: signUpStep)
        let router: MVDBSignUpRouterProtocol = MVDBSignUpNameRouter()
        let presenter: MVDBSignUpPresenterInputProtocol & MVDBSignUpInteractorOutputProtocol = MVDBSignUpNamePresenter(interactor: interactor, router: router)
        let view = MVDBSignUpNameViewController(presenter: presenter)
        
        interactor.presenter = presenter
        presenter.view = view
        router.viewController = view
        
        return view
    }
    
    func popView(view: MVDBSignUpPresenterOutputProtocol?, toSignUpStep: SignUpStep) {
        guard let view = view as? UIViewController else { return }
        view.navigationController?.popViewController(animated: true)
    }
    
    func pushView(from view: MVDBSignUpPresenterOutputProtocol?, to viewToPresent: UIViewController) {
        guard let view = view as? UIViewController else { return }
        view.navigationController?.pushViewController(viewToPresent, animated: true)
    }
    
    func presentView(from view: MVDBSignUpPresenterOutputProtocol?, to viewToPresent: UIViewController) {
        guard let view = view as? UIViewController else { return }
        view.present(viewToPresent, animated: true)
    }
}
