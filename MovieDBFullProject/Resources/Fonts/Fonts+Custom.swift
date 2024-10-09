//
//  Fonts+Custom.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 16/10/23.
//

import UIKit

private enum FontName: String, CaseIterable {
    
    case helveticaNeueLight = "Raleway-Light"
    case ralewayRegular = "Raleway-Regular"
    case ralewayMedium = "Raleway-Medium"
    case ralewaySemiBold = "Raleway-SemiBold"
    case helveticaNeueBold = "Raleway-Bold"
    
    case robotoMedium = "Roboto-Medium"
    case robotoMediumItalic = "Roboto-MediumItalic"
    case robotoBold = "Roboto-Bold"
    case robotoBoldItalic = "Roboto-BoldItalic"
    case robotoRegular = "Roboto-Regular"
}

extension UIFont {
    
// Example how to reuse custom fonts
//    static var systemBold36: UIFont {
//        guard let font = UIFont(name: FontName.ralewayBold.rawValue, size: 28.0) else {
//            assertionFailure("Font not found")
//            return UIFont.systemFont(ofSize: 28.0, weight: .bold)
//        }
//        return font
//    }
    
    static var systemBold36: UIFont {
        let font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return font
    }
    
    static var systemMedium16: UIFont {
        let font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return font
    }
    
    static var systemMedium12: UIFont {
        let font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return font
    }
    
}

