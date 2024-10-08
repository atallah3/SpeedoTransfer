//
//  UIView+EXT.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 30/08/2024.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    func addGradientBackgroundColor(colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = self.layer.cornerRadius
        
       
        if let oldLayer = self.layer.sublayers?.first as? CAGradientLayer {
            self.layer.replaceSublayer(oldLayer, with: gradientLayer)
        } else {
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    func addShadow(to view: UIView, shadowColor: CGColor) {
        view.layer.shadowColor = shadowColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 3
        view.layer.masksToBounds = false
    }
}

