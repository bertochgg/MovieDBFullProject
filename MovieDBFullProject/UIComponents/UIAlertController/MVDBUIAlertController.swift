//
//  MVDBUIAlertView.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 25/09/24.
//

import UIKit

final class MVDBUIAlertController {
    
    static let shared = MVDBUIAlertController()

    private init() {}
    
    func showAlert(title: String? = nil, message: String? = nil, preferredStyle: UIAlertController.Style = .alert, actions: [UIAlertAction]? = nil) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        guard let actions = actions else { 
            let defaultAction = UIAlertAction(title: "Dismiss", style: .destructive, handler: nil)
            alert.addAction(defaultAction)
            return alert
        }
        
        for action in actions {
            alert.addAction(action)
        }
        
        return alert
    }
    
    func showCallCustomerServiceAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Call customer service", message: "Would you like to call customer support?", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel)
        let callAction = UIAlertAction(title: "Call", style: .default) { _ in
            if let phoneURL = URL(string: "tel://2461495390"),
               UIApplication.shared.canOpenURL(phoneURL) {
                UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
            }
        }
        alert.addAction(dismissAction)
        alert.addAction(callAction)
        
        return alert
    }
}


