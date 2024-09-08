//
//  HelpVCViewController.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 07/09/2024.
//

import UIKit

class HelpVC: UIViewController {
    //MARK: - @IBOutlets
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var phoneView: UIView!
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    //MARK: - Functions
    private func configureViews() {
        emailView.addShadow(to: emailView, shadowColor: UIColor.black.cgColor)
        phoneView.addShadow(to: phoneView, shadowColor: UIColor.black.cgColor)
    }
    
    //MARK: - @IBActions
    @IBAction func didTaponEmailBtn(_ sender: UIButton) {
        print("go to mail app")
    }
    
    @IBAction func didTapOnPhoneBtn(_ sender: UIButton) {
        print("go to phone app")
    }
}
