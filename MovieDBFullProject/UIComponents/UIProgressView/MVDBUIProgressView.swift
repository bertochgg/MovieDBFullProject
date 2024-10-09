//
//  MVDBUIProgressView.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 18/09/24.
//

import UIKit

final class MVDBUIProgressView: UIProgressView {

    init() {
        super.init(frame: .zero)
        setupCustomProgressView()
        setupProgressViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCustomProgressView() {
        self.backgroundColor = .midnightShadow
        self.trackTintColor = .midnightShadow
        self.progressTintColor = .frostedPearl
        self.setCornerRadius(4)
    }
    
    private func setupProgressViewConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 8).isActive = true
    }

}
