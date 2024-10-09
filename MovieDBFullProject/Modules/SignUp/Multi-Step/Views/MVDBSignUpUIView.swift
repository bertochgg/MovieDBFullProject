//
//  MVDBSignUpUIView.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 23/09/24.
//

import UIKit

final class MVDBSignUpUIView: UIView {
    
    weak var delegate: MVDBSignUpNameUIViewDelegate?
    
    lazy private var titleLabel = MVDBUILabel(style: .h2, weight: .bold)
    lazy private var descriptionLabel = MVDBUILabel(style: .h3, weight: .regular, textAlignment: .natural, textColor: .slateMist)
    lazy private var firstDataTextField = MVDBTextField()
    lazy private var secondDataTextField = MVDBTextField()
    lazy private var termsLabel = MVDBUILabel(style: .h3, weight: .regular, textAlignment: .natural, textColor: .slateMist)
    lazy private var continueButton = MVDBUIButton()
    private lazy var views: [UIView] = [titleLabel, descriptionLabel, firstDataTextField, secondDataTextField, termsLabel, continueButton]
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
        tapGestureForDismissKeyboard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(titleText: String, descriptionText: String, termsText: String, placeholderText: String, secondPlaceholderText: String? = nil, signUpStep: SignUpStep = .name) {
        titleLabel.text = titleText
        descriptionLabel.text = descriptionText
        termsLabel.text = termsText
        firstDataTextField.placeholder = placeholderText
        signUpStep != .password ? (secondDataTextField.isHidden = true) : (secondDataTextField.placeholder = secondPlaceholderText)
        firstDataTextField.isSecureTextEntry = signUpStep == .password
        secondDataTextField.isSecureTextEntry = signUpStep == . password
    }
    
    private func setupView() {
        backgroundColor = .black
        views.forEach { view in addSubview(view) }
        titleLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
        termsLabel.numberOfLines = 0
        firstDataTextField.delegate = self
        secondDataTextField.delegate = self
        continueButton.addTarget(self, action: #selector(continueNextSignUpView), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            firstDataTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            firstDataTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            firstDataTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            firstDataTextField.heightAnchor.constraint(equalToConstant: 41),
            
            secondDataTextField.topAnchor.constraint(equalTo: firstDataTextField.bottomAnchor, constant: 16),
            secondDataTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            secondDataTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            secondDataTextField.heightAnchor.constraint(equalToConstant: 41),
            
            termsLabel.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -28),
            termsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            termsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            continueButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -45),
            continueButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 43)
        ])
    }
    
    private func tapGestureForDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
        addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func dissmissKeyboard() {
        endEditing(true)
    }
    
    @objc
    private func continueNextSignUpView() {
        delegate?.didTapNextViewButton()
    }
    
}

extension MVDBSignUpUIView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstDataTextField.resignFirstResponder()
        secondDataTextField.resignFirstResponder()
        return true
    }
}
