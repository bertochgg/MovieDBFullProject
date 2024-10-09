//
//  MVDBSignUpInteractor.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 23/09/24.
//

import Foundation

final class MVDBSignUpNameInteractor: MVDBSignUpInteractorInputProtocol {
    weak var presenter: MVDBSignUpInteractorOutputProtocol?
    private let signUpNameEntity: MVDBSignUpNameEntity
    private let signUpEmailEntity: MVDBSignUpEmailEntity
    private let signUpPasswordEntity: MVDBSignUpPasswordEntity
    private let signUpStep: SignUpStep
    
    init(signUpNameEntity: MVDBSignUpNameEntity, signUpEmailEntity: MVDBSignUpEmailEntity, signUpPasswordEntity: MVDBSignUpPasswordEntity, signUpStep: SignUpStep) {
        self.signUpNameEntity = signUpNameEntity
        self.signUpEmailEntity = signUpEmailEntity
        self.signUpPasswordEntity = signUpPasswordEntity
        self.signUpStep = signUpStep
    }
    
    func getCopiesForView() {
        switch signUpStep {
        case .name:
            getCopiesForNameStep()
        case .email:
            getCopiesForEmailStep()
        case .password:
            getCopiesForPasswordStep()
        }
    }
    
    func proceedToNextStep(currentStep: SignUpStep) -> SignUpStep {
        switch currentStep {
        case .name: return .email
        case .email: return .password
        case .password: return .password
        }
    }
    
    func proceedToPreviousStep(currentStep: SignUpStep) -> SignUpStep {
        switch currentStep {
        case .password: return .email
        case .email: return .name
        case .name: return .name
        }
    }
    
    func updateProgressState(currentStep: SignUpStep) -> Float {
        switch currentStep {
        case .name:
            return 1/3
        case .email:
            return 2/3
        case .password:
            return 3/3
        }
    }
    
    
    private func getCopiesForNameStep() {
        let nameStepViewCopies = (title: signUpNameEntity.title,
                                  description: signUpNameEntity.description,
                                  textFieldPlaceholder: [signUpNameEntity.textFieldPlaceholder],
                                  termsText: signUpNameEntity.termsText)
        presenter?.didObtainCopiesForView(with: nameStepViewCopies, and: signUpStep)
    }
    
    private func getCopiesForEmailStep() {
        let emailStepViewCopies = (title: signUpEmailEntity.title,
                                   description: signUpEmailEntity.description,
                                   textFieldPlaceholder: [signUpEmailEntity.textFieldPlaceholder],
                                   termsText: signUpEmailEntity.termsText)
        presenter?.didObtainCopiesForView(with: emailStepViewCopies, and: signUpStep)
    }
    
    private func getCopiesForPasswordStep() {
        let passwordStepViewCopies = (title: signUpPasswordEntity.title,
                                      description: signUpPasswordEntity.description,
                                      textFieldPlaceholder: [signUpPasswordEntity.firstTextFieldPlaceholder, 
                                                             signUpPasswordEntity.secondTextFieldPlaceholder],
                                      termsText: signUpPasswordEntity.termsText)
        presenter?.didObtainCopiesForView(with: passwordStepViewCopies, and: signUpStep)
    }
}
