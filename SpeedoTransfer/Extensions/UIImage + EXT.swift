//
//  textFieldImage.swift
//  SpeedoTransfer
//
//  Created by Abdullah Silva on 11/09/2024.
//

import Foundation
import UIKit
extension UITextField {
    static func addEyeIcon(to textFields: [UITextField], initialImage: UIImage, toggleImage: UIImage) {
        let padding: CGFloat = 16

        for txtField in textFields {
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 24 + padding, height: 24))
            let eyeImageView = UIImageView(frame: CGRect(x: 0, y: 0.0, width: 24, height: 24))
            eyeImageView.image = initialImage
            eyeImageView.isUserInteractionEnabled = true

            containerView.addSubview(eyeImageView)
            txtField.rightView = containerView
            txtField.rightViewMode = .always

            let tapGesture = UITapGestureRecognizer(target: txtField, action: #selector(togglePasswordVisibility(_:)))
            eyeImageView.addGestureRecognizer(tapGesture)
            eyeImageView.tag = txtField.hash
        }
    }

    @objc func togglePasswordVisibility(_ sender: UITapGestureRecognizer) {
        guard let eyeImageView = sender.view as? UIImageView else { return }

        if isSecureTextEntry {
            isSecureTextEntry = false
            eyeImageView.image = UIImage(named: "openedEye")
        } else {
            isSecureTextEntry = true
            eyeImageView.image = UIImage(named: "closedEye")
        }
    }
}
func addrightimage(txtField: UITextField, andimage img: UIImage) {
    let padding: CGFloat = 16
    let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 24 + padding, height: 24))
    let rightImageView = UIImageView(frame: CGRect(x: 0, y: 0.0, width: 24, height: 24))
    rightImageView.image = img
    containerView.addSubview(rightImageView)
    txtField.rightView = containerView
    txtField.rightViewMode = .always
}
