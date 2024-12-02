//
//  String+Validations.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 11/11/24.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{3,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+").evaluate(with: self)
    }
    
    var isValidForNames: Bool {
        return range(of: "[^a-zA-Z\\ñ\\Ñ\\ ]", options: .regularExpression) == nil && self != ""
    }
    
    var isValidPassword: Bool {
        return self.isValidLongitudePassword
        && self.containsCapital
        && self.isAlphanumeric
        && self.containsSymbol
        && !self.containsWhiteSpace
        && !self.containsNewLine
    }
    
    var isValidLongitudePassword: Bool {
        return self.count >= 8 && self.count <= 16
    }
    
    var containsCapital: Bool {
        for char in self where char.isUppercase {
            return true
        }
        return false
    }
    
    var containsSymbol: Bool {
        let symbolsCharacterSet = CharacterSet.symbols
            .union(.punctuationCharacters)
            .union(.illegalCharacters)
            .union(.nonBaseCharacters)
        return self.rangeOfCharacter(from: symbolsCharacterSet) != nil
    }
    
    var containsWhiteSpace: Bool {
        let symbolsCharacterSet = CharacterSet.whitespaces
        return self.rangeOfCharacter(from: symbolsCharacterSet) != nil
    }
    
    var isAlphanumeric: Bool {
        let symbolsCharacterSet = CharacterSet.alphanumerics
        return self.rangeOfCharacter(from: symbolsCharacterSet) != nil
    }
    
    var containsNewLine: Bool {
        let symbolsCharacterSet = CharacterSet.newlines
        return self.rangeOfCharacter(from: symbolsCharacterSet) != nil
    }
    
    //q no sea igual a nombre
    
//    var containsConsecutiveNumbers: Bool {
//        
//    }
//    
//    var containsConsecutiveCharacters: Bool {
//        
//    }
}
