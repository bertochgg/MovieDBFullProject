//
//  CapsuleUIButton.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 13/10/23.
//

import UIKit

final class CapsuleUIButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCapsuleButton(buttonColor: UIColor,
                           buttonTitle: String,
                           textColor: UIColor,
                           fontSize: CGFloat,
                           fontWeight: UIFont.Weight,
                           borderColor: UIColor? = nil,
                           borderWidth: CGFloat? = nil,
                           buttonImage: UIImage? = nil) {
        layer.cornerRadius = 28
        backgroundColor = buttonColor
        setTitleColor(textColor, for: .normal)
        layer.borderWidth = borderWidth ?? 0
        layer.borderColor = borderColor?.cgColor
        setImage(buttonImage, for: .normal)
        setTitle(buttonTitle, for: .normal)
        titleLabel?.textAlignment = .center
        titleLabel?.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        
    }
}
