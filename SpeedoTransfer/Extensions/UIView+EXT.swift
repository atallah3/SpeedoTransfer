//
//  UIView+EXT.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 30/08/2024.
//

import UIKit

extension UIView {
    func addGradientBackgroundColor() {
        let colors: [UIColor] = [UIColor.white, UIColor.lightRed]
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        
        // Setting gradient direction relative to the view's bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Top-left
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)   // Bottom-left
        
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = self.layer.cornerRadius
        
       
        if let oldLayer = self.layer.sublayers?.first as? CAGradientLayer {
            self.layer.replaceSublayer(oldLayer, with: gradientLayer)
        } else {
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}

