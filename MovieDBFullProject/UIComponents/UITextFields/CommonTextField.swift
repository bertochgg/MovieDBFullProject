//
//  CommonTextField.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 05/06/24.
//

import UIKit

final class CommonTextField: UITextField {
    
    private var isImageNeeded: Bool
    
    init(isImageNeeded: Bool = false) {
        self.isImageNeeded = isImageNeeded
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
        isImageNeeded ? addLeftIcon(image: UIImage(systemName: "magnifyingglass")) : paddingLeftForTextOnly()
    }
    
    private func paddingLeftForTextOnly() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: frame.size.height))
        leftView = paddingView
        leftViewMode = .always
    }
    
    private func addLeftIcon(image: UIImage?) {
        guard let image = image else { return }
        let iconView = UIImageView(frame: CGRect(x: 16, y: 0, width: 20, height: 20))
        iconView.image = image
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = .frostedPearl
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: frame.size.height))
        containerView.addSubview(iconView)
        iconView.center.y = containerView.center.y
        leftView = containerView
        leftViewMode = .always
    }
}
