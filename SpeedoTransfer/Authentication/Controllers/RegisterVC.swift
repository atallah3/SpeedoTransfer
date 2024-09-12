//
//  RegisterVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 05/09/2024.
//

import UIKit

class RegisterVC: UIViewController {
    //MARK: - @IBOutlets
    @IBOutlet var myView: UIView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmedPasswordTF: UITextField!
    
    //MARK: - Properties
    var user: User?
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRegisterVC()
        UserManager.shared().isOpendBefore = true
    //MARK: - handle images on textFields
        let userIcon = UIImage(named: "user")
        addrightimage(txtField: nameTF, andimage: userIcon!)
        
        let emailIcon = UIImage(named: "email")
        addrightimage(txtField: emailTF, andimage: emailIcon!)
        
        let closedEyeIcon = UIImage(named: "closedEye")
        let openedEyeIcon = UIImage(named: "openedEye")
        UITextField.addEyeIcon(to: [passwordTF, confirmedPasswordTF], initialImage: closedEyeIcon!, toggleImage: openedEyeIcon!)
    }

    //MARK: - Functions
    private func configureRegisterVC() {
        myView.addGradientBackgroundColor(colors: UIColor.FirstGradientolors)
        title = "Sign up"
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    private func isValidData() -> Bool {
        guard nameTF.text?.trimmed != "" else {
            self.showAlert(title: "Enter your name", message: "You must enter your name to complete registration process", buttonLabel: nil)
            return false
        }
        
        guard emailTF.text?.trimmed != "" else {
            self.showAlert(title: "Enter your email", message: "You must enter your Email to complete registration process", buttonLabel: nil)
            return false
        }
        
        guard let password = passwordTF.text?.trimmed,
              validatePassword(password),
              confirmedPasswordTF.text?.trimmed == password
        else {
            self.showAlert(title: "Invalid Password", message: "Your password must be at least 6 characters long and include a capital letter, a lowercase letter, a number, and a special character.", buttonLabel: nil)
            return false
        }

        return true
    }
    
    func validatePassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*]).{6,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        
        return passwordTest.evaluate(with: password)
    }

    
    private func goToLoginScreen() {
        let loginVC = LoginVC(nibName: "LoginVC", bundle: nil)
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    private func goToContinuedSignUpScreen() {
        let signUp = ContinuedSignUpVC(nibName: "ContinuedSignUpVC", bundle: nil)
        signUp.name = nameTF.text
        signUp.email = emailTF.text
        signUp.password = passwordTF.text
        navigationController?.pushViewController(signUp, animated: true)
    }
    
    //MARK: - @IBActions
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        guard isValidData() else { return }
        goToContinuedSignUpScreen()
    }
    
    @IBAction func signInBtnTapped(_ sender: UIButton) {
        goToLoginScreen()
    }
    
}

