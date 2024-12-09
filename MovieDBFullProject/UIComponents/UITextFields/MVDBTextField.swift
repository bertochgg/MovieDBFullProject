//
//  CommonTextField.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 05/06/24.
//

import UIKit

final class MVDBTextField: UITextField {
    
    enum IconSide {
        case left
        case right
    }
    
    private var isImageNeeded: Bool
    private var isSecure: Bool
    
    init(isImageNeeded: Bool = false, isSecure: Bool = false) {
        self.isImageNeeded = isImageNeeded
        self.isSecure = isSecure
        super.init(frame: .zero)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextField() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .frostedPearl
        backgroundColor = .midnightShadow
        layer.borderWidth = 1
        layer.borderColor = UIColor.steelGray.cgColor
        layer.cornerRadius = 8
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "Placeholder", attributes: [NSAttributedString.Key.foregroundColor: UIColor.stormySky])
        isImageNeeded ? addIconOnTextField(image: UIImage(systemName: "magnifyingglass"), side: .left) : paddingLeftForTextOnly()
        isSecureTextEntry = isSecure
    }
    
    private func paddingLeftForTextOnly() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: frame.size.height))
        leftView = paddingView
        leftViewMode = .always
    }
    
    func addIconOnTextField(image: UIImage?, side: IconSide, selector: Selector? = nil, target: Any? = nil) {
        guard let image = image else { return }
        let xPosition: Int = side == .right ? 4 : 16
        let iconSize: Int = side == .right ? 30 : 20
        let iconView = UIImageView(frame: CGRect(x: xPosition, y: 0, width: iconSize, height: iconSize))
        iconView.image = image
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = .frostedPearl
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: frame.size.height))
        containerView.addSubview(iconView)
        iconView.center.y = containerView.center.y
        switch side {
        case .left:
            leftView = containerView
            leftViewMode = .always
        case .right:
            rightView = containerView
            rightViewMode = .always
            rightView?.isUserInteractionEnabled = side == .right
            containerView.isUserInteractionEnabled = side == .right
            iconView.isUserInteractionEnabled = side == .right
            let tapGesture = UITapGestureRecognizer(target: target, action: selector)
            rightView?.addGestureRecognizer(tapGesture)
        }
    }
}
