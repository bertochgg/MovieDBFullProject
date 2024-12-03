//
//  MVDBHelpUIView.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 25/09/24.
//

import UIKit

final class MVDBHelpUIView: UIView {
    weak var delegate: MVDBHelpUIViewDelegate?
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.line.dotted.person.fill")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .frostedPearl
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var titleLabel = MVDBUILabel(style: .h1, weight: .bold)
    private lazy var descriptionLabel = MVDBUILabel(style: .h3, weight: .medium, textAlignment: .center, textColor: .slateMist)
    private lazy var callCustomerServiceButton = MVDBUIButton(textColor: .midnightShadow, backgroundColor: .frostedPearl)
    private lazy var closeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "xmark")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .frostedPearl
        let tapDismissAction: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dissmissHelpView))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapDismissAction)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var views: [UIView] = [backgroundImageView, titleLabel, closeImageView, descriptionLabel, callCustomerServiceButton]

    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(titleText: String, descriptionText: String, buttonTitle: String) {
        titleLabel.text = titleText
        descriptionLabel.text = descriptionText
        callCustomerServiceButton.setTitle(buttonTitle, for: .normal)
    }
    
    private func setupView() {
        views.forEach { view in addSubview(view) }
        titleLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
        backgroundColor = .black
        callCustomerServiceButton.addTarget(self, action: #selector(callCustomerServiceButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            closeImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            closeImageView.heightAnchor.constraint(equalToConstant: 25),
            closeImageView.widthAnchor.constraint(equalToConstant: 25),
            
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            backgroundImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 120) ,
            backgroundImageView.heightAnchor.constraint(equalToConstant: 100),
            backgroundImageView.widthAnchor.constraint(equalToConstant: 140),
            
            descriptionLabel.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 20),
            descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
            callCustomerServiceButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            callCustomerServiceButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            callCustomerServiceButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            callCustomerServiceButton.heightAnchor.constraint(equalToConstant: 43)
        ])
    }
    
    @objc
    private func callCustomerServiceButtonTapped() {
        delegate?.didTapCallCustomerServiceButton()
    }
    
    @objc
    private func dissmissHelpView() {
        delegate?.didTapDismissHelpView()
    }
}
