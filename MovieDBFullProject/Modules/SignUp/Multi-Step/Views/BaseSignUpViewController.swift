//
//  BaseSignUpViewController.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/02/24.
//

import UIKit

class BaseSignUpViewController: UIViewController {
    
    enum SignUpStep {
        case name
        case email
        case password
    }
    
    var getDataTextFieldText: String {
        return dataTextField.text ?? ""
    }
    
    var getSecondDataTextFieldText: String {
        return secondDataTextField.text ?? ""
    }
    
    var signUpStep: SignUpStep = .name
    
    private var views: [UIView] = []
    
    lazy private var titleLabel = GenericUILabel(style: .h2, weight: .bold)
    lazy private var descriptionLabel = GenericUILabel(style: .h3, weight: .regular, textAlignment: .natural, textColor: .slateMist)
    
    lazy private var dataTextField = CommonTextField()
    lazy private var secondDataTextField = CommonTextField()
    
    lazy private var termsLabel = GenericUILabel(style: .h3, weight: .regular, textAlignment: .natural, textColor: .slateMist)
    
    lazy private var continueButton = CommonUIButton(buttonTitle: "Continue")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        views = [titleLabel, descriptionLabel, dataTextField, secondDataTextField, termsLabel, continueButton]
        setupCommonUI()
        termsLabel.text = "By loging in or signing up you agree to Foodlam’s Terms and Condition & Privacy Policies"
        dataTextField.delegate = self
        secondDataTextField.delegate = self
        continueButton.addTarget(self, action: #selector(continueNextView), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    func configure(titleText: String,
                   descriptionText: String,
                   placeholderText: String,
                   needsSecondTextField: Bool = false,
                   secondPlaceholderText: String? = nil) {
        titleLabel.text = titleText
        descriptionLabel.text = descriptionText
        dataTextField.placeholder = placeholderText
        !needsSecondTextField ? (secondDataTextField.isHidden = true) : (secondDataTextField.placeholder = secondPlaceholderText)
    }
    
    private func setupCommonUI() {
        views.forEach { view in self.view.addSubview(view) }
        view.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            dataTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            dataTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            dataTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            dataTextField.heightAnchor.constraint(equalToConstant: 41),
            
            secondDataTextField.topAnchor.constraint(equalTo: dataTextField.bottomAnchor, constant: 16),
            secondDataTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            secondDataTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            secondDataTextField.heightAnchor.constraint(equalToConstant: 41),
            
            termsLabel.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -28),
            termsLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            termsLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            continueButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -45),
            continueButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 43)
        ])
    }
    
    @objc
    private func dissmissKeyboard() {
        view.endEditing(true)
    }
}

extension BaseSignUpViewController {
    @objc func continueNextView() {}
}

extension BaseSignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dataTextField.resignFirstResponder()
        secondDataTextField.resignFirstResponder()
        return true
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        switch self.signUpStep {
//        case .name:
//            return string.count > 2
//        case .email:
//            return string.count < 2
//        case.password:
//            return string.count < 2
//        }
//    }
}
