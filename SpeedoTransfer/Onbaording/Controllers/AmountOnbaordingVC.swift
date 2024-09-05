//
//  AmountOnbaordingVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 29/08/2024.
//

import UIKit

class AmountOnbaordingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        
    }
    
    private func configureViewController() {
        view.addGradientBackgroundColor(colors: UIColor.FirstGradientolors)
        title = "Amount"
//        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func skipBtnTapped(_ sender: UIButton) {
    }
}
