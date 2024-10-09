//
//  MVDBLobbyRouter.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 20/09/24.
//

import UIKit

final class MVDBLobbyRouter: MVDBLobbyRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createLobbyModule() -> UIViewController {
        let interactor: MVDBLobbyInteractorInputProtocol = MVDBLobbyInteractor(lobbyEntity: MVDBLobbyEntity())
        let router: MVDBLobbyRouterProtocol = MVDBLobbyRouter()
        let presenter: MVDBLobbyPresenterInputProtocol & MVDBLobbyInteractorOutputProtocol = MVDBLobbyPresenter(interactor: interactor, router: router)
        
        let view = MVDBLobbyViewController(presenter: presenter)
        
        interactor.presenter = presenter
        presenter.view = view
        router.viewController = view
        
        return view
    }
    
    func createSignUpModule(from view: MVDBLobbyPresenterOutputProtocol?, to viewToPresent: UIViewController) {
        guard let view = view as? UIViewController else { return }
        view.navigationController?.pushViewController(viewToPresent, animated: true)
    }
}
