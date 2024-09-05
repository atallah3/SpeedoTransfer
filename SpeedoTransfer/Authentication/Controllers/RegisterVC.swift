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
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRegisterVC()
    }
    
    //MARK: - Private Functions
    private func configureRegisterVC() {
        myView.addGradientBackgroundColor(colors: UIColor.FirstGradientolors)
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
              confirmedPasswordTF.text?.trimmed == password
        else {
            self.showAlert(title: "Enter your password", message: "You must enter your password to complete registration process", buttonLabel: nil)
            return false
        }
        
        return true
    }
    
    private func goToLoginScreen() {
        let loginVC = LoginVC(nibName: "LoginVC", bundle: nil)
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    //MARK: - @IBActions
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        print("btn tapped")
        guard isValidData() else { return }
        goToLoginScreen()
    }
    
    @IBAction func signInBtnTapped(_ sender: UIButton) {
        goToLoginScreen()
    }
    
}

