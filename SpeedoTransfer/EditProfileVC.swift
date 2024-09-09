//
//  EditProfileVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 09/09/2024.
//

import UIKit

class EditProfileVC: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var dateTF: UITextField!
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    //MARK: - Functions
    private func configureViewController() {
        view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        title = "Edit Profile"
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
        
        guard countryTF.text?.trimmed != "" else {
            self.showAlert(title: "Enter a valid country", message: "Please enter a valid country to complete your registeration", buttonLabel: nil)
            return false
        }
        
        guard dateTF.text?.trimmed != "" else {
            self.showAlert(title: "Enter a valid date", message: "Please enter a valid date to complete your registeration", buttonLabel: nil)
            return false
        }
        
        return true
    }
    
    private func openCountryBottomSheet() {
        let countryVC = CountryBottomSheetVC(nibName: "CountryBottomSheetVC", bundle: nil)
        countryVC.delegate = self
        self.showBottomSheet(viewController: countryVC)
    }
    
    //MARK: - @IBActions
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        guard isValidData() else { return }
        print("saved in backend")
    }
    
    @IBAction func countryTFTapped(_ sender: Any) {
        openCountryBottomSheet()
    }
}

//MARK: - CountryBottomSheet extension
extension EditProfileVC: CountrySelectionDelegate {
    func countryDidSelect(name: String) {
        countryTF.text = name
    }
}
