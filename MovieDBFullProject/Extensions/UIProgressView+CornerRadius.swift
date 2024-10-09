//
//  UIProgressView+CornerRadius.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 23/09/24.
//

import UIKit

extension UIProgressView {
    func setCornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        
        // Set the corner radius for the track (background) layer
        if let trackLayer = self.subviews.first {
            trackLayer.layer.cornerRadius = radius
            trackLayer.clipsToBounds = true
        }
        
        // Set the corner radius for the progress (foreground) layer
        if let progressLayer = self.subviews.last {
            progressLayer.layer.cornerRadius = radius
            progressLayer.clipsToBounds = true
        }
    }
}
