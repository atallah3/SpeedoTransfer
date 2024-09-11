//
//  textFieldImage.swift
//  SpeedoTransfer
//
//  Created by Abdullah Silva on 11/09/2024.
//

import Foundation
import UIK
func addrightimage(txtField: UITextField, andimage img: UIImage) {
    let padding: CGFloat = 16
    let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 24 + padding, height: 24))
    let rightImageView = UIImageView(frame: CGRect(x: 0, y: 0.0, width: 24, height: 24))
    rightImageView.image = img
    containerView.addSubview(rightImageView)
    txtField.rightView = containerView
    txtField.rightViewMode = .always
}

