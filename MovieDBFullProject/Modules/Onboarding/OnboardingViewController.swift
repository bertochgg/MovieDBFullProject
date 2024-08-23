//
//  OnboardingViewController.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 04/10/23.
//

import UIKit

private enum OnboardingViewConstants {
    enum Strings {
        static let onboardingTitleLabelText: String = "Streaming all movie on the go"
        static let onboardingDescriptionLabelText: String = "Stream 4k quality movies, enjoy with downloads.\n"
        static let onboardingDescriptionLabelTextPartTwo: String = "Unlimited entertainment on your hands."
        
        static let onboardingSignInButtonText: String = "Sign In"
        static let onboardingSignUpButtonText: String = "Sign Up"
    }
    
    enum Numbers {
        static let fontSize36: CGFloat = 36
        static let fontSize16: CGFloat = 16
        
        static let buttonCornerRadius8: CGFloat = 8
        static let buttonBorderWidth: CGFloat = 1
    }
    
}

final class OnboardingViewController: UIViewController {
    private let presenter: ViewToPresenterOnboardingProtocol
    
    init(presenter: ViewToPresenterOnboardingProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy private var views: [UIView] = [
        onboardingImageView,
        onboardingTitleLabel,
        onboardingDescriptionLabel,
        onboardingSubDescriptionLabel,
        buttonsVerticalStackView
    ]
    
    lazy private var viewsForButtonsVStackView: [UIView] = [
        signInButton,
        signUpButton
    ]
    
    lazy private var onboardingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = Constants.Images.onboardingBackgroundImage
        return imageView
    }()
    
    lazy private var onboardingTitleLabel: UILabel = {
        let label = UILabel()
        label.text = OnboardingViewConstants.Strings.onboardingTitleLabelText
        label.font = .systemBold36
        label.textColor = .frostedPearl
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy private var onboardingDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = OnboardingViewConstants.Strings.onboardingDescriptionLabelText
        label.textColor = .slateMist
        label.font = .systemMedium16
        label.numberOfLines = 1
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy private var onboardingSubDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = OnboardingViewConstants.Strings.onboardingDescriptionLabelTextPartTwo
        label.textColor = .slateMist
        label.font = .systemMedium16
        label.numberOfLines = 1
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy private var buttonsVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    lazy private var signInButton = CommonUIButton(textColor: .black, backgroundColor: .frostedPearl, buttonTitle: OnboardingViewConstants.Strings.onboardingSignInButtonText)
    lazy private var signUpButton = CommonUIButton(textColor: .frostedPearl, backgroundColor: .black, buttonTitle: OnboardingViewConstants.Strings.onboardingSignUpButtonText, borderIsNeeded: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupGradientOverlay()
        setupViews()
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
    }
    
    private func setupViews() {
        views.forEach { view in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        viewsForButtonsVStackView.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.buttonsVerticalStackView.addArrangedSubview(view)
        }
        
        NSLayoutConstraint.activate([
            onboardingImageView.topAnchor.constraint(equalTo: view.topAnchor),
            onboardingImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onboardingImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            onboardingImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            onboardingTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            onboardingTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            onboardingDescriptionLabel.topAnchor.constraint(equalTo: onboardingTitleLabel.bottomAnchor, constant: 12),
            onboardingDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            onboardingDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            onboardingSubDescriptionLabel.topAnchor.constraint(equalTo: onboardingDescriptionLabel.bottomAnchor),
            onboardingSubDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            onboardingSubDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            onboardingSubDescriptionLabel.bottomAnchor.constraint(equalTo: buttonsVerticalStackView.topAnchor, constant: -40),
            
            buttonsVerticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -52),
            buttonsVerticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonsVerticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            signInButton.heightAnchor.constraint(equalToConstant: 43),
            signUpButton.heightAnchor.constraint(equalToConstant: 43)
        ])
    }
    
    private func setupGradientOverlay() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.0, 0.67]
        
        onboardingImageView.layer.addSublayer(gradientLayer)
    }
    
    
}

private extension OnboardingViewController {
    @objc func signInTapped() {
        self.presenter.signInButtonTapped()
    }
    
    @objc func signUpTapped() {
        guard let navigationController = navigationController else { return }
        self.presenter.signUpButtonTapped(with: navigationController)
    }
}
