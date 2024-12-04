//
//  SignUpEntity.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 16/10/23.
//

import Foundation

final class SignUpEntity: Codable {
    static let shared = SignUpEntity()
    
    var firstName: String?
    var email: String?
    var password: String?
    
    private init() { }
}
