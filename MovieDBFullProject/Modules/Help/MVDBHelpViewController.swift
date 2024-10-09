//
//  MVDBHelpViewController.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 25/09/24.
//

import UIKit

final class MVDBHelpViewController: UIViewController {
    private let presenter: MVDBHelpPresenterInputProtocol
    private var mainView: MVDBHelpUIView?
    
    override func loadView() {
        mainView = MVDBHelpUIView()
        mainView?.delegate = self
        self.view = mainView
    }
    
    init(presenter: MVDBHelpPresenterInputProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setupLeftCustomBarItem(with: #selector(backButtonTapped), title: "Help", on: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    @objc
    private func backButtonTapped() {
        presenter.goBack()
    }

}

extension MVDBHelpViewController: MVDBHelpPresenterOutputProtocol {
    func displayCopiesForView(title: String, description: String, buttonTitle: String) {
        mainView?.configure(titleText: title, descriptionText: description, buttonTitle: buttonTitle)
    }
}

extension MVDBHelpViewController: MVDBHelpUIViewDelegate {
    func didTapCallCustomerServiceButton() {
        presenter.callCustomerService()
    }
}
