//
//  ConfirmationOnbaordingVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 29/08/2024.
//

import UIKit

class ConfirmationOnbaordingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBarHidden()
        
    }
    

    private func setNavBarHidden() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func skipBtnTapped(_ sender: UIButton) {
    }
}
