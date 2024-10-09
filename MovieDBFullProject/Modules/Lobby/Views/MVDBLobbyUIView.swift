//
//  MVDBLobbyUIView.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 20/09/24.
//

import UIKit

final class MVDBLobbyUIView: UIView {
    
    weak var delegate: MVDBLobbyUIViewDelegate?

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "MVDBLobbyImageBackground")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var lobbyTitleLabel = MVDBUILabel(style: .h1, weight: .bold, textAlignment: .center)
    private lazy var lobbyDescriptionLabel = MVDBUILabel(style: .h3, weight: .medium, textAlignment: .center, textColor: .slateMist)
    private lazy var lobbySignInButton = MVDBUIButton(textColor: .midnightShadow, backgroundColor: .frostedPearl)
    private lazy var lobbySignUpButton = MVDBUIButton(textColor: .frostedPearl, backgroundColor: .black, borderIsNeeded: true)
    private lazy var views: [UIView] = [backgroundImageView, lobbyTitleLabel, lobbyDescriptionLabel, lobbySignInButton, lobbySignUpButton]
    
    private let gradientLayer = CAGradientLayer()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
        setupGradientOverlay()
        lobbySignInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        lobbySignUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = backgroundImageView.bounds
    }
    
    func updateStrings(lobbyTitle: String, lobbyDescription: String, signInButtonTitle: String, signUpButtonTitle: String) {
        lobbyTitleLabel.text = lobbyTitle
        lobbyDescriptionLabel.text = lobbyDescription
        lobbySignInButton.setTitle(signInButtonTitle, for: .normal)
        lobbySignUpButton.setTitle(signUpButtonTitle, for: .normal)
    }
    
    private func setupView() {
        views.forEach { view in self.addSubview(view) }
        lobbyTitleLabel.numberOfLines = 0
        lobbyDescriptionLabel.numberOfLines = 0
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            lobbySignUpButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -52),
            lobbySignUpButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            lobbySignUpButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            lobbySignUpButton.heightAnchor.constraint(equalToConstant: 43),
            
            lobbySignInButton.bottomAnchor.constraint(equalTo: lobbySignUpButton.topAnchor, constant: -16),
            lobbySignInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            lobbySignInButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            lobbySignInButton.heightAnchor.constraint(equalToConstant: 43),
            
            lobbyDescriptionLabel.bottomAnchor.constraint(equalTo: lobbySignInButton.topAnchor, constant: -40),
            lobbyDescriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            lobbyDescriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            lobbyTitleLabel.bottomAnchor.constraint(equalTo: lobbyDescriptionLabel.topAnchor, constant: -12),
            lobbyTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            lobbyTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    
    private func setupGradientOverlay() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.0, 0.67]
        backgroundImageView.layer.addSublayer(gradientLayer)
    }
    
    @objc
    private func signInButtonTapped() {
        delegate?.didTapSignInButton()
    }
    
    @objc
    private func signUpButtonTapped() {
        delegate?.didTapSignUpButton()
    }

}
