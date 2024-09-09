//
//  ChangePasswordVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 09/09/2024.
//

import UIKit

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var currentPasswordTF: UITextField!
    @IBOutlet weak var newPasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    private func configureViewController() {
        view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        title = "Change Password"
    }
    
    private func isValidData() -> Bool {
        
        guard currentPasswordTF.text?.trimmed != "" ,
              newPasswordTF.text?.trimmed != ""
        else {
            self.showAlert(title: "Enter your Password", message: "You must enter your Password to complete Updating process", buttonLabel: nil)
            return false
        }
        return true
    }
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        guard isValidData() else { return }
        print("new password updated")
    }
    
}
