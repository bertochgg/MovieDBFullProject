//
//  SignUpFirebaseService.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 16/10/23.
//

import Foundation
//import Firebase
//import FirebaseStorage
//import FirebaseAuth

protocol SignUpFirebaseServiceProtocol: AnyObject {
    typealias SignUpResult = Swift.Result<SignUpEntity, Error>
    func saveUser(entity: SignUpEntity, completion: @escaping (SignUpResult) -> Void)
}

final class SignUpFirebaseService: SignUpFirebaseServiceProtocol {
    func saveUser(entity: SignUpEntity, completion: @escaping (SignUpResult) -> Void) {
//        Auth.auth().createUser(withEmail: entity.email ?? "",
//                               password: entity.password ?? "") { authResult, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            let userData: [String: Any] = [
//                "first_name": entity.firstName,
//                "last_name": entity.lastName,
//                "email": entity.email,
//                "password": entity.password
//            ]
//            
//            // TODO: Handle error
//            guard let userId = authResult?.user.uid else { return }
//            let storage = Database.database().reference().child("users").child(userId)
//            
//            storage.setValue(userData)
//            
//        }
    }
    
    
}
