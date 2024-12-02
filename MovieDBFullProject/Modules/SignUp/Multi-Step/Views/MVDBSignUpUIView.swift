//
//  MVDBSignUpUIView.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 23/09/24.
//

import UIKit

final class MVDBSignUpUIView: UIView {
    
    weak var delegate: MVDBSignUpNameUIViewDelegate?
    
    private lazy var signUpStep: SignUpStep = .name
    private lazy var titleLabel: MVDBUILabel = MVDBUILabel(style: .h2, weight: .bold)
    private lazy var helperForPasswordImageView: UIImageView = UIImageView(image: UIImage(systemName: "questionmark.circle"))
    private lazy var descriptionLabel: MVDBUILabel = MVDBUILabel(style: .h3, weight: .regular, textAlignment: .natural, textColor: .slateMist)
    private lazy var firstDataTextField: MVDBTextField = MVDBTextField()
    private lazy var firstErrorLabel: MVDBUILabel = MVDBUILabel(style: .h3, weight: .regular, textColor: .red)
    private lazy var secondDataTextField: MVDBTextField = MVDBTextField()
    private lazy var secondErrorLabel: MVDBUILabel = MVDBUILabel(style: .h3, weight: .regular, textColor: .red)
    private lazy var termsLabel: MVDBUILabel = MVDBUILabel(style: .h3, weight: .regular, textAlignment: .natural, textColor: .slateMist)
    private lazy var continueButton: MVDBUIButton = MVDBUIButton()
    private lazy var views: [UIView] = [titleLabel, helperForPasswordImageView, descriptionLabel, firstDataTextField, secondDataTextField, termsLabel, continueButton, firstErrorLabel, secondErrorLabel]
    
    private var secondDataTextFieldWithFirstErrorConstraint: NSLayoutConstraint?
    private var secondDataTextFieldWithoutFirstErrorConstraint: NSLayoutConstraint?
    private var isPasswordVisible: Bool = true
    private var isPasswordVisibleForSecondTextField: Bool = true
    
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
        self.signUpStep = signUpStep
        titleLabel.text = titleText
        descriptionLabel.text = descriptionText
        termsLabel.text = termsText
        firstDataTextField.placeholder = placeholderText
        signUpStep != .password ? (secondDataTextField.isHidden = true) : (secondDataTextField.placeholder = secondPlaceholderText)
        firstErrorLabel.isHidden = true
        secondErrorLabel.isHidden = true
        
        switch signUpStep {
        case .name:
            break
        case .email:
            firstDataTextField.keyboardType = .emailAddress
            firstDataTextField.autocorrectionType = .no
            firstDataTextField.textContentType = .emailAddress
            firstDataTextField.autocapitalizationType = .none
        case .password:
            helperForPasswordImageView.isHidden = false
            helperForPasswordImageView.isUserInteractionEnabled = true
            let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showPasswordHelperInstructions))
            helperForPasswordImageView.addGestureRecognizer(tapGesture)
            firstDataTextField.isSecureTextEntry = true
            secondDataTextField.isSecureTextEntry = true
            firstDataTextField.addIconOnTextField(image: UIImage(systemName: "eye.fill"), side: .right, selector: #selector(showPassword), target: self)
            secondDataTextField.addIconOnTextField(image: UIImage(systemName: "eye.fill"), side: .right, selector: #selector(showPasswordSecondTextField), target: self)
        }
    }
    
    private func setupView() {
        backgroundColor = .black
        helperForPasswordImageView.translatesAutoresizingMaskIntoConstraints = false
        helperForPasswordImageView.tintColor = .systemBlue
        helperForPasswordImageView.isHidden = true
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
            
            helperForPasswordImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            helperForPasswordImageView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 16),
            helperForPasswordImageView.heightAnchor.constraint(equalToConstant: 30),
            helperForPasswordImageView.widthAnchor.constraint(equalToConstant: 30),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            firstDataTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            firstDataTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            firstDataTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            firstDataTextField.heightAnchor.constraint(equalToConstant: 41),
            
            firstErrorLabel.topAnchor.constraint(equalTo: firstDataTextField.bottomAnchor, constant: 5),
            firstErrorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            firstErrorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            secondDataTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            secondDataTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            secondDataTextField.heightAnchor.constraint(equalToConstant: 41),
            
            secondErrorLabel.topAnchor.constraint(equalTo: secondDataTextField.bottomAnchor, constant: 5),
            secondErrorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            secondErrorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            termsLabel.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -28),
            termsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            termsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            continueButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -45),
            continueButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 43)
        ])
        
        secondDataTextFieldWithFirstErrorConstraint = secondDataTextField.topAnchor.constraint(equalTo: firstErrorLabel.bottomAnchor, constant: 16)
        secondDataTextFieldWithoutFirstErrorConstraint = secondDataTextField.topAnchor.constraint(equalTo: firstDataTextField.bottomAnchor, constant: 16)
        secondDataTextFieldWithoutFirstErrorConstraint?.isActive = true
    }
    
    private func tapGestureForDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
        addGestureRecognizer(tapGesture)
    }
    
    @discardableResult
    private func validate(textField: UITextField, errorLabel: MVDBUILabel) -> Bool {
        guard let text = textField.text, !text.isEmpty else {
            errorLabel.text = "This field is required."
            errorLabel.isHidden = false
            textField.layer.borderColor = UIColor.red.cgColor
            updateSecondTextFieldPosition(showError: !errorLabel.isHidden)
            return false
        }
        
        var isValid = true
        switch signUpStep {
        case .name:
            if !text.isValidForNames {
                errorLabel.text = "Enter a valid name."
                errorLabel.isHidden = false
                textField.layer.borderColor = UIColor.red.cgColor
                isValid = false
                updateSecondTextFieldPosition(showError: !errorLabel.isHidden)
            }
        case .email:
            if !text.isValidEmail {
                errorLabel.text = "Enter a valid email."
                errorLabel.isHidden = false
                textField.layer.borderColor = UIColor.red.cgColor
                isValid = false
                updateSecondTextFieldPosition(showError: !errorLabel.isHidden)
            }
            
        case .password:
            if textField == firstDataTextField {
                if textField.text?.isValidPassword ?? false {
                    errorLabel.text = ""
                    errorLabel.isHidden = true
                    textField.layer.borderColor = UIColor.steelGray.cgColor
                } else {
                    errorLabel.text = "Enter a valid password."
                    errorLabel.isHidden = false
                    textField.layer.borderColor = UIColor.red.cgColor
                    isValid = false
                    updateSecondTextFieldPosition(showError: !errorLabel.isHidden)
                }
            } else if textField == secondDataTextField {
                if textField.text != firstDataTextField.text {
                    errorLabel.text = "Confirm your password."
                    errorLabel.isHidden = false
                    textField.layer.borderColor = UIColor.red.cgColor
                    isValid = false
                    updateSecondTextFieldPosition(showError: !errorLabel.isHidden)
                } else {
                    errorLabel.text = ""
                    errorLabel.isHidden = true
                    textField.layer.borderColor = UIColor.steelGray.cgColor
                }
            }
        }
        
        if isValid {
            errorLabel.text = ""
            errorLabel.isHidden = true
            textField.layer.borderColor = UIColor.steelGray.cgColor
        }
        
        return isValid
    }

    private func updateSecondTextFieldPosition(showError: Bool) {
        secondDataTextFieldWithoutFirstErrorConstraint?.isActive = !showError
        secondDataTextFieldWithFirstErrorConstraint?.isActive = showError
        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
    }
    
    @objc
    private func dissmissKeyboard() {
        endEditing(true)
    }
    
    @objc
    private func continueNextSignUpView() {
        let isValidFirstText = validate(textField: firstDataTextField, errorLabel: firstErrorLabel)
        let isValidSecondText = signUpStep == .password ? validate(textField: secondDataTextField, errorLabel: secondErrorLabel) : true
        
        if isValidFirstText && isValidSecondText {
            delegate?.didTapNextViewButton()
        }
    }
    
    @objc
    private func showPassword() {
        isPasswordVisible.toggle()
        firstDataTextField.isSecureTextEntry = isPasswordVisible
        let iconImage = isPasswordVisible ? UIImage(systemName: "eye.fill") : UIImage(systemName: "eye.slash.fill")
        firstDataTextField.addIconOnTextField(image: iconImage, side: .right, selector: #selector(showPassword), target: self)
    }
    
    @objc
    private func showPasswordSecondTextField() {
        isPasswordVisibleForSecondTextField.toggle()
        secondDataTextField.isSecureTextEntry = isPasswordVisibleForSecondTextField
        let iconImage = isPasswordVisibleForSecondTextField ? UIImage(systemName: "eye.fill") : UIImage(systemName: "eye.slash.fill")
        secondDataTextField.addIconOnTextField(image: iconImage, side: .right, selector: #selector(showPasswordSecondTextField), target: self)
    }
    
    @objc private func showPasswordHelperInstructions() {
        
    }
}

extension MVDBSignUpUIView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == firstDataTextField {
            validate(textField: firstDataTextField, errorLabel: firstErrorLabel)
        } else if textField == secondDataTextField && signUpStep == .password {
            validate(textField: secondDataTextField, errorLabel: secondErrorLabel)
        }
    }
}
