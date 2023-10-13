//
//  UIFont+NewFonts.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 04/10/23.
//

import UIKit

private enum FontName: String, CaseIterable {
    case sfProDisplayBold = "SFPRODISPLAYULTRALIGHTITALIC"
}

extension UIFont {
    // MARK: - Sf Pro Display BOLD
    static var sfProDisplayBold36: UIFont {
        guard let font = UIFont(name: FontName.sfProDisplayBold.rawValue, size: 36.0) else {
            assertionFailure("Font not found")
            return UIFont.systemFont(ofSize: 36.0, weight: .bold)
        }
        return font
    }
}
