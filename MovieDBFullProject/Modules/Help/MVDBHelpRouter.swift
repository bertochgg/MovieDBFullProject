//
//  MVDBHelpRouter.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 25/09/24.
//

import UIKit

final class MVDBHelpRouter: MVDBHelpRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createHelpModule() -> UIViewController {
        let interactor: MVDBHelpInteractorInputProtocol = MVDBHelpInteractor(entity: MVDBHelpEntity())
        let router: MVDBHelpRouterProtocol = MVDBHelpRouter()
        let presenter: MVDBHelpPresenterInputProtocol & MVDBHelpInteractorOutputProtocol = MVDBHelpPresenter(interactor: interactor, router: router)
        let view = MVDBHelpViewController(presenter: presenter)
        
        interactor.presenter = presenter
        presenter.view = view
        router.viewController = view
        
        return view
    }
    
    func popView(view: MVDBHelpPresenterOutputProtocol?) {
        guard let view = view as? UIViewController else { return }
        view.navigationController?.popViewController(animated: true)
    }
    
    func presentAlert(from view: MVDBHelpPresenterOutputProtocol?, to alertToPresent: UIViewController) {
        guard let view = view as? UIViewController else { return }
        view.present(alertToPresent, animated: true)
    }
}
