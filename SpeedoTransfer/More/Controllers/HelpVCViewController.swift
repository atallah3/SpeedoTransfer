//
//  HelpVCViewController.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 07/09/2024.
//

import UIKit

class HelpVCViewController: UIViewController {

    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var phoneView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    private func configureViews() {
        emailView.addShadow(to: emailView, shadowColor: UIColor.black.cgColor)
        phoneView.addShadow(to: phoneView, shadowColor: UIColor.black.cgColor)
    }
    
    @IBAction func didTaponEmailBtn(_ sender: UIButton) {
        print("go to mail app")
    }
    
    @IBAction func didTapOnPhoneBtn(_ sender: UIButton) {
        print("go to phone app")
    }
}
