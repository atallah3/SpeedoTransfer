//
//  RegisterVC.swift
//  SpeedoTransfer
//
//  Created by Abdullah Silva on 29/08/2024.
//

import UIKit

class RegisterVC: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var errorlabel: UILabel!
    
    private var isPasswordVisible = false
    private var isConfirmPasswordVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorlabel.isHidden = true
    }
    func validateSignup() {
          guard let password = passwordTextField.text, isValidPassword(password) else {
              showPasswordError()
              return
          }
          clearPasswordError()
      }
      
      func isValidPassword(_ password: String) -> Bool {
          let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[0-9])[A-Za-z\\d]{8,}$")
          return passwordPredicate.evaluate(with: password)
      }
      
      func showPasswordError() {
          passwordTextField.layer.borderColor = UIColor.red.cgColor
          passwordTextField.layer.borderWidth = 1.0
          confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
          confirmPasswordTextField.layer.borderWidth = 1.0
          errorlabel.text = "Password must be at least 8 characters long and include a number."
          errorlabel.textColor = UIColor.red
          errorlabel.isHidden = false
          UIView.animate(withDuration: 0.3) {
              self.passwordTextField.layer.borderColor = UIColor.red.cgColor
          }
      }
      func clearPasswordError() {
          passwordTextField.layer.borderColor = UIColor.clear.cgColor
          errorlabel.text = ""
          errorlabel.isHidden = true
      }

//MARK: button Sign UP
    @IBAction func SignUpBtn(_ sender: UIButton) {
        
        guard let name = fullNameTextField.text?.trimmed , !name.isEmpty ,  let email = emailTextField.text?.trimmed, !email.isEmpty, let password = passwordTextField.text?.trimmed, !password.isEmpty, let confirmPassword = confirmPasswordTextField.text?.trimmed ,!confirmPassword.isEmpty, password == confirmPassword
        else {return }
        
        let user: User = User(name: name, email: email, password: password)
        let sb = UIStoryboard(name: "Authentication", bundle: nil)
        let continueToCountryVC = sb.instantiateViewController(withIdentifier: "CountryAndDateVC") as! CountryAndDateVC
        self.navigationController?.pushViewController(continueToCountryVC, animated: true)
        validateSignup()
    }

    @IBAction func signInbtn1(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Authentication", bundle: nil)
        let toLogin = sb.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(toLogin, animated: true)
    }
    

   
}
