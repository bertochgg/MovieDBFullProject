//
//  UINavController+Custom.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 23/09/24.
//

import UIKit

extension UINavigationController {
    
    func setCustomNavigationItems(progress: Float, sender: UIViewController, leftSelector: Selector, rightSelector: Selector) {
        let rightBarButton = MVDBUIButton(style: .capsule,
                                          font: .systemMedium12,
                                          textColor: .frostedPearl,
                                          backgroundColor: .black,
                                          buttonTitle: "Help",
                                          borderIsNeeded: true)
        let progressView = MVDBUIProgressView()
        progressView.progress = progress
        
        NSLayoutConstraint.activate([
            rightBarButton.heightAnchor.constraint(equalToConstant: 30),
            rightBarButton.widthAnchor.constraint(equalToConstant: 57),
            
            progressView.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: sender, action: leftSelector)
        sender.navigationItem.leftBarButtonItem = leftBarButtonItem
        
        let rightBarButtonItem = UIBarButtonItem(customView: rightBarButton)
        rightBarButton.addTarget(sender, action: rightSelector, for: .touchUpInside)
        sender.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        sender.navigationItem.titleView = progressView
        
    }
    
    func setupLeftCustomBarItem(with selector: Selector, title: String, on sender: UIViewController) {
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: sender, action: selector)
        sender.navigationItem.leftBarButtonItem = leftBarButtonItem
        sender.navigationItem.title = title
    }
    
}
