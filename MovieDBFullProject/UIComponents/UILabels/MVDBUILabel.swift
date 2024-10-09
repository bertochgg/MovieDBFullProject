//
//  GenericUILabel.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 07/06/24.
//

import UIKit

final class MVDBUILabel: UILabel {
    
    enum TitleStyle {
        case h1
        case h2
        case h3
    }
    
    init(style: TitleStyle, weight: UIFont.Weight, textAlignment: NSTextAlignment = .left, textColor: UIColor = .frostedPearl) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        setupTitleLabel(style: style, weight: weight, textColor: textColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleLabel(style: TitleStyle, weight: UIFont.Weight, textColor: UIColor) {
        translatesAutoresizingMaskIntoConstraints = false
        self.textColor = textColor
        titleFontSelection(style: style, weight: weight)
    }
    
    private func titleFontSelection(style: TitleStyle, weight: UIFont.Weight) {
        switch style {
        case .h1:
            font = .systemFont(ofSize: 36, weight: weight)
        case .h2:
            font = .systemFont(ofSize: 24, weight: weight)
        case .h3:
            font = .systemFont(ofSize: 16, weight: weight)
            self.numberOfLines = 0
        }
    }
}
