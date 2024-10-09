//
//  MVDBLobbyViewController.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 20/09/24.
//

import UIKit

final class MVDBLobbyViewController: UIViewController {
    
    private let presenter: MVDBLobbyPresenterInputProtocol
    private var mainView: MVDBLobbyUIView?
    
    override func loadView() {
        mainView = MVDBLobbyUIView()
        mainView?.delegate = self
        self.view = mainView
    }
    
    init(presenter: MVDBLobbyPresenterInputProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
}

extension MVDBLobbyViewController: MVDBLobbyPresenterOutputProtocol {
    func displayLobbyStrings(title: String, description: String, signInButton: String, signUp: String) {
        guard let mainView = mainView else { return }
        mainView.updateStrings(lobbyTitle: title,
                               lobbyDescription: description,
                               signInButtonTitle: signInButton,
                               signUpButtonTitle: signUp)
    }
}

extension MVDBLobbyViewController: MVDBLobbyUIViewDelegate {
    func didTapSignInButton() {
        
    }
    
    func didTapSignUpButton() {
        presenter.initializeSignUpModule()
    }
}
