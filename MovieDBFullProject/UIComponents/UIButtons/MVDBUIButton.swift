//
//  CustomUIButton.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 13/10/23.
//

import UIKit

final class MVDBUIButton: UIButton {
    
    enum ButtonStyle {
        case rectangle
        case capsule
        case onlyImage
    }
    
    init(style: ButtonStyle = .rectangle, font: UIFont = .systemMedium16, textColor: UIColor = .stormySky, backgroundColor: UIColor = .charcoalAbyss, buttonTitle: String = "Continue", borderIsNeeded: Bool = false, imageName: String? = nil) {
        super.init(frame: .zero)
        setupButton(style: style, font: font, textColor: textColor, backgroundColor: backgroundColor, buttonTitle: buttonTitle, borderIsNeeded: borderIsNeeded, imageName: imageName)
        addTapAnimation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton(style: ButtonStyle, font: UIFont, textColor: UIColor, backgroundColor: UIColor, buttonTitle: String, borderIsNeeded: Bool, imageName: String?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(buttonTitle, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.titleLabel?.textAlignment = .center
        self.setTitleColor(textColor, for: .normal)
        borderIsNeeded ? ({self.layer.borderWidth = 1; self.layer.borderColor = UIColor.frostedPearl.cgColor}()) : ()
        switch style {
        case .rectangle:
            self.layer.cornerRadius = 8
        case .capsule:
            self.layer.cornerRadius = 15
        case .onlyImage:
            self.setImage(UIImage(systemName: imageName ?? ""), for: .normal)
            self.setTitle(nil, for: .normal)
        }
        
    }
    
    private func addTapAnimation() {
        addTarget(self, action: #selector(handleTouchDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(handleTouchUp), for: [.touchUpInside, .touchCancel, .touchDragExit])
    }
    
    @objc 
    private func handleTouchDown() {
        animate(scale: 0.95, alpha: 0.7)
    }
    
    @objc 
    private func handleTouchUp() {
        animate(scale: 1.0, alpha: 1.0)
    }
    
    private func animate(scale: CGFloat, alpha: CGFloat) {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.transform = CGAffineTransform(scaleX: scale, y: scale)
            self.alpha = alpha
        }, completion: nil)
    }
}
