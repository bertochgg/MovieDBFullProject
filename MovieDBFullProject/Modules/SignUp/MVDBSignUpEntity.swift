//
//  MVDBSignUpEntity.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 23/09/24.
//

import Foundation

struct MVDBSignUpEntity {
    
}

struct MVDBSignUpNameEntity {
    let title: String = "What's your name"
    let description: String = "Enter your name to continue to create your account"
    let textFieldPlaceholder: String = "Enter your name"
    let termsText: String = "By loging in or signing up you agree to Foodlam’s Terms and Condition & Privacy Policies"
}

struct MVDBSignUpEmailEntity {
    let title: String = "What's your email"
    let description: String = "Enter your email to continue to create your account"
    let textFieldPlaceholder: String = "Enter your email"
    let termsText: String = "By loging in or signing up you agree to Foodlam’s Terms and Condition & Privacy Policies"
}

struct MVDBSignUpPasswordEntity {
    let title: String = "Create your password"
    let description: String = "Create your password to continue to create your account"
    let firstTextFieldPlaceholder: String = "Create your password"
    let secondTextFieldPlaceholder: String = "Confirm youe password"
    let termsText: String = "By loging in or signing up you agree to Foodlam’s Terms and Condition & Privacy Policies"
}

enum SignUpStep {
    case name
    case email
    case password
}
