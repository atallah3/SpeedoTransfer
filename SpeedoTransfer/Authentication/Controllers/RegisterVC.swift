//
//  RegisterVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 03/09/2024.
//

import UIKit

//
//  RegisterVC.swift
//  SpeedoTransfer
//
//  Created by Abdullah Silva on 29/08/2024.
//

import UIKit

class RegisterVC: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var fullNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    private var isPasswordVisible = false
    private var isConfirmPasswordVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func validateSignup() {
        guard let password = passwordTextField.text,
              let confirmedPassword = confirmPasswordTextField.text else {
            showPasswordError(message: "Please enter both password and confirmation.")
            return
        }
        if !isValidPassword(password: password, confirmedPassword: confirmedPassword) {
            showPasswordError(message: "Password must be at least 8 characters long, include uppercase and lowercase letters, a number, and a special character. Ensure passwords match.")
            return
        }
                clearPasswordError()

        guard let name = fullNameTextField.text, !name.isEmpty else {

            fullNameTextField.layer.borderColor = UIColor.red.cgColor
            fullNameTextField.layer.borderWidth = 1.0
            return
        }
        clearNameError()

    }



    func isValidPassword(password: String, confirmedPassword: String) -> Bool {
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$")
        guard password == confirmedPassword else {
            return false
        }
        return passwordPredicate.evaluate(with: password)
    }
    func showPasswordError(message: String) {
        passwordTextField.layer.borderColor = UIColor.red.cgColor
        passwordTextField.layer.borderWidth = 1.0
        confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
        confirmPasswordTextField.layer.borderWidth = 1.0
//        errorlabel.text = message
//        errorlabel.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.passwordTextField.layer.borderColor = UIColor.red.cgColor
            self.confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
        }
    }
    func clearPasswordError() {
        passwordTextField.layer.borderColor = UIColor.clear.cgColor
        passwordTextField.layer.borderWidth = 0.0
        confirmPasswordTextField.layer.borderColor = UIColor.clear.cgColor
        confirmPasswordTextField.layer.borderWidth = 0.0
//        errorlabel.text = ""
//        errorlabel.isHidden = true
    }
    func clearNameError() {
        fullNameTextField.layer.borderColor = UIColor.clear.cgColor
        fullNameTextField.layer.borderWidth = 0.0
    }


    
    //MARK: button Sign UP
    @IBAction func SignUpBtn(_ sender: UIButton) {
        validateSignup()
        guard let name = fullNameTextField.text?.trimmed , !name.isEmpty ,  let email = emailTextField.text?.trimmed, !email.isEmpty, let password = passwordTextField.text?.trimmed, !password.isEmpty, let confirmPassword = confirmPasswordTextField.text?.trimmed ,!confirmPassword.isEmpty, password == confirmPassword
        else {return }
        let _: User = User(name: name, email: email, password: password)
        let sb = UIStoryboard(name: "Authentication", bundle: nil)
        let continueToCountryVC = sb.instantiateViewController(withIdentifier: "CountryAndDateVC") as! CountryAndDateVC
        self.navigationController?.pushViewController(continueToCountryVC, animated: true)
        
        
    }
    
    @IBAction func signInbtn1(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Authentication", bundle: nil)
        let toLogin = sb.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(toLogin, animated: true)
    }
}
