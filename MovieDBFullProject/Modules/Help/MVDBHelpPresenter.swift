//
//  MVDBHelpPresenter.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 25/09/24.
//

import Foundation

final class MVDBHelpPresenter: MVDBHelpPresenterInputProtocol {
    weak var view: MVDBHelpPresenterOutputProtocol?
    private let interactor: MVDBHelpInteractorInputProtocol
    private let router: MVDBHelpRouterProtocol
    
    init(interactor: MVDBHelpInteractorInputProtocol, router: MVDBHelpRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.getCopiesForDesign()
    }
    
    func callCustomerService() {
        let callAlert = MVDBUIAlertController.shared.showCallCustomerServiceAlert()
        router.presentAlert(from: view, to: callAlert)
    }
    
    func goBack() {
        router.popView(view: view)
    }
}

extension MVDBHelpPresenter: MVDBHelpInteractorOutputProtocol {
    func didObtainedCopiesForView(with copies: (title: String, description: String, buttonTitle: String)) {
        view?.displayCopiesForView(title: copies.title, description: copies.description, buttonTitle: copies.buttonTitle)
    }
}
