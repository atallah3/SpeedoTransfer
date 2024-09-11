//
//  paymentTransferVC.swift
//  SpeedoTransfer
//
//  Created by Abdullah Silva on 07/09/2024.
//

import UIKit

class paymentTransferVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        
    }


    private func configureViewController() {
        view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        title = "Transfer"
    }

    @IBAction func backToHomeBtn(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        }

    
    @IBAction func AddToFavBtn(_ sender: UIButton) {
    }
}
