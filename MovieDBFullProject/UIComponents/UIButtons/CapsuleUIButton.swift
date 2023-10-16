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
        setupCapsuleButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCapsuleButton() {
        layer.cornerRadius = 28
        layer.borderWidth = 1
        layer.borderColor = UIColor.titleWhite.cgColor
        
        backgroundColor = .black
        setTitleColor(.titleWhite, for: .normal)
    }
}
