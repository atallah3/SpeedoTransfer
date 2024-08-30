//
//  RegisterVC.swift
//  SpeedoTransfer
//
//  Created by Abdullah Silva on 29/08/2024.
//

import UIKit

class RegisterVC: UIViewController {
    // MARK: - Connections
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordEyeImageView: UIImageView!
    @IBOutlet weak var confirmPasswordEyeImageView: UIImageView!
    
    private var isPasswordVisible = false
    private var isConfirmPasswordVisible = false
//MARK: button Sign UP
    @IBAction func SignUpBtn(_ sender: UIButton) {
        guard let name = fullNameTextField.text?.trimmed,  let email = emailTextField.text?.trimmed, let password = passwordTextField.text?.trimmed, let confirmPassword = confirmPasswordTextField.text?.trimmed, password == confirmPassword
        else {return}
        
        let user: User = User(name: name, email: email, password: password, confirmPassword: confirmPassword)
        let sb = UIStoryboard(name: "Authentication", bundle: nil)
        let continueToCountryVC = sb.instantiateViewController(withIdentifier: "CountryAndDateVC") as! CountryAndDateVC
        self.navigationController?.pushViewController(continueToCountryVC, animated: true)
    }

    @IBAction func signInbtn1(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Authentication", bundle: nil)
        let toLogin = sb.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(toLogin, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let passwordEyeTapGesture = UITapGestureRecognizer(target: self, action: #selector(togglePasswordVisibility))
        passwordEyeImageView.isUserInteractionEnabled = true
        passwordEyeImageView.addGestureRecognizer(passwordEyeTapGesture)

        let confirmPasswordEyeTapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleConfirmPasswordVisibility))
        confirmPasswordEyeImageView.isUserInteractionEnabled = true
        confirmPasswordEyeImageView.addGestureRecognizer(confirmPasswordEyeTapGesture)
    }
    
    @objc func togglePasswordVisibility() {
        isPasswordVisible.toggle()
        passwordTextField.isSecureTextEntry = !isPasswordVisible
        let eyeImageName = isPasswordVisible ? "Component 2" : "closedEye"
        passwordEyeImageView.image = UIImage(named: eyeImageName)
    }
    
    @objc func toggleConfirmPasswordVisibility() {
        isConfirmPasswordVisible.toggle()
        confirmPasswordTextField.isSecureTextEntry = !isConfirmPasswordVisible
        let eyeImageName = isConfirmPasswordVisible ? "Component 2" : "closedEye"
        confirmPasswordEyeImageView.image = UIImage(named: eyeImageName)
    }
}
