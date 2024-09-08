//
//  ContinuedSignUpVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 06/09/2024.
//

import UIKit

class ContinuedSignUpVC: UIViewController {
    //MARK: - @IBOutlets
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var dateOfBirthTF: UITextField!
    
    //MARK: - Properties
    var selectedCountry: String? {
        didSet {
            countryTF.text = selectedCountry
        }
    }
    
    //MARK: - View lif cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    //MARK: - Functions
    private func configureViewController() {
        view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func isValidData() -> Bool{
        guard countryTF.text?.trimmed != "" else {
            self.showAlert(title: "Enter a valid country", message: "Please enter a valid country to complete your registeration", buttonLabel: nil)
            return false
        }
        
        guard dateOfBirthTF.text?.trimmed != "" else {
            self.showAlert(title: "Enter a valid date", message: "Please enter a valid date to complete your registeration", buttonLabel: nil)
            return false
        }
        
        return true
    }
    
    private func goToLoginScreen() {
        let loginVC = LoginVC(nibName: "LoginVC", bundle: nil)
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    private func openCountryBottomSheet() {
        let countryVC = CountryBottomSheetVC(nibName: "CountryBottomSheetVC", bundle: nil)
        self.showBottomSheet(viewController: countryVC)
        countryVC.parentVC = self
    }
    //MARK: - @IBActions
    @IBAction func countryTextFieldTapped(_ sender: UIButton) {
        openCountryBottomSheet()
    }
    
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        guard isValidData() else { return }
        goToLoginScreen()
    }
    
    @IBAction func signInBtnTapped(_ sender: UIButton) {
        goToLoginScreen()
    }
}

