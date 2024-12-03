//
//  MVDBHelperModalUIView.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 02/12/24.
//

import UIKit

final class MVDBHelperModalUIView: UIView {
    
    private lazy var titleLabel: MVDBUILabel = MVDBUILabel(style: .h3, weight: .bold, textColor: UIColor.frostedPearl)
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.textColor = .frostedPearl
        textView.font = .systemFont(ofSize: 12, weight: .regular)
        textView.backgroundColor = .clear
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    private lazy var views: [UIView] = [titleLabel, textView]

    init() {
        super.init(frame: .zero)
        setupView()
        setupConstrainst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(titleText: String, descriptionText: String) {
        titleLabel.text = titleText
        textView.text = descriptionText
    }
    
    private func setupView() {
        backgroundColor = .midnightShadow
        clipsToBounds = true
        views.forEach { view in addSubview(view) }
        titleLabel.text = "Password Rules"
        textView.text = """
- Your password must have a longitude of 8 to 16 characters.
- Your password must contain at least one capital.
- Your password must be alphanumeric.
- Your password must contain at least one symbol.
- Your password must not coint white spaces.
- Your password must not contain new lines.
"""
    }
    
    private func setupConstrainst() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            textView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
}
