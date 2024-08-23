//
//  CustomUIProgressView.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 13/10/23.
//

import UIKit

final class CustomUIProgressView: UIProgressView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCustomProgressView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCustomProgressView() {
        layer.cornerRadius = 12
        backgroundColor = .midnightShadow
        progressTintColor = .frostedPearl
    }
}
