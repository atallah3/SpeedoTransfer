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
    var name: String?
    var email: String?
    var password: String?
    var user: User?
    var selectedCountry: String? {
        didSet {
            countryTF.text = selectedCountry
        }
    }
    
    //MARK: - View lif cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        
        let dateIcon = UIImage(named: "date")
        addrightimage(txtField: dateOfBirthTF, andimage: dateIcon!)
    }
    
    //MARK: - Functions
    private func configureViewController() {
        view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func registerUser() {
        guard isValidData() else { return }
        
        NetworkManager.shared.registerUser(name: name!, country: selectedCountry!, eamil: email!, password: password!, dateOfBirth: dateOfBirthTF.text!) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                self.user = user
                print("User: \(user)")
                
                DispatchQueue.main.async {
                    self.goToLoginScreen()
                }
            case .failure(let failure):
                print(failure)
            }
        }
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
        
        guard let name = name, let email = email, let password = password else {
            self.showAlert(title: "Error in registeration Proccess", message: "Please try again later", buttonLabel: nil)
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
        countryVC.delegate = self
        self.showBottomSheet(viewController: countryVC)
    }
    
    //MARK: - @IBActions
    @IBAction func countryTextFieldTapped(_ sender: UIButton) {
        openCountryBottomSheet()
    }
    
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        registerUser()
        print("login")
        goToLoginScreen()
    }
    
    @IBAction func signInBtnTapped(_ sender: UIButton) {
        goToLoginScreen()
    }
}

extension ContinuedSignUpVC: CountrySelectionDelegate {
    func countryDidSelect(name: String) {
        selectedCountry = name
    }
}
