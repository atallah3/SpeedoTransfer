//
//  LoginVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 05/09/2024.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureRegisterVC()
    }
    
    private func configureRegisterVC() {
        view.addGradientBackgroundColor(colors: UIColor.FirstGradientolors)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

}
