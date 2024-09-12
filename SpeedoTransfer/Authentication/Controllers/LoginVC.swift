//
//  LoginVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 05/09/2024.
//

import UIKit

class LoginVC: UIViewController {
    //MARK: - @IBOutlets
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    //MARK: - Properties
    var user: LoggedInUser?
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRegisterVC()
        showRightImageIcon()
        UserManager.shared().isLoggedin = false
    }
    
    //MARK: - Functions
    private func configureRegisterVC() {
        view.addGradientBackgroundColor(colors: UIColor.FirstGradientolors)
        title = "Sign In"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func showRightImageIcon() {
        let emailIcon = UIImage(named: "email")
        let closedEyeIcon = UIImage(named: "closedEye")
        let openedEyeIcon = UIImage(named: "openedEye")
        
        addrightimage(txtField: emailTF, andimage: emailIcon!)
        UITextField.addEyeIcon(to: [passwordTF], initialImage: closedEyeIcon!, toggleImage: openedEyeIcon!)
    }
    
    private func loginUser() {
        guard isValidDate() else { return }
        
        NetworkManager.shared.loginWith(email: emailTF.text!, password: passwordTF.text!) { result in
            switch result {
            case .success(let user):
                self.user = user
                self.saveUserData(user: user)
                self.goToTabBarViewController()
            case .failure(let failure):
                self.showAlert(title: "Please Try Again", message: "", buttonLabel: nil)
            }
        }
    }
    
    private func saveUserData(user: LoggedInUser) {
        UserDefaultsManager.shared.saveUserData(user: user)
    }
    private func isValidDate() -> Bool {
        guard emailTF?.text?.trimmed != "" else {
            self.showAlert(title: "Incorrect email, Please try again", message: "if you don`t have an account please sign up", buttonLabel: nil)
            return false
        }
        
        guard passwordTF?.text?.trimmed != "" else {
            self.showAlert(title: "Incorrect password, Please try again", message: "if you don`t have an account please sign up", buttonLabel: nil)
            return false
        }
        return true
    }
    
    private func goToTabBarViewController() {
        let tabBar = STTabBarController()
        tabBar.modalPresentationStyle = .fullScreen
        self.present(tabBar, animated: true)
    }
    
    private func goToRegisterScreen() {
        let registerVC = RegisterVC(nibName: "RegisterVC", bundle: nil)
        registerVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    //MARK: - @IBActions
    @IBAction func signInBtnTapped(_ sender: UIButton) {
        print("btnatapped")
        guard isValidDate() else {return}
        loginUser()
       
    }
    
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        goToRegisterScreen()
    }
}
