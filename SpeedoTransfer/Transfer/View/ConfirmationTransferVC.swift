//
//  confirmationTransferVC.swift
//  SpeedoTransfer
//
//  Created by Abdullah Silva on 07/09/2024.
//

import UIKit

class confirmationTransferVC: UIViewController {
    
    @IBOutlet var transferAmount: [UILabel]!
    @IBOutlet weak var senderName: UILabel!
    @IBOutlet weak var senderAccNumber: UILabel!
    @IBOutlet weak var receiverName: UILabel!
    @IBOutlet weak var recieverAccNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }

    private func configureViewController() {
        view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        title = "Transfer"
    }
    
    private func goToPaymentScreen() {
        let paymentVC = paymentTransferVC(nibName: "paymentTransferVC", bundle: nil)
        self.navigationController?.pushViewController(paymentVC, animated: true)
    }
    @IBAction func confirmBtnTapped(_ sender: UIButton) {
        goToPaymentScreen()
    }
    
    @IBAction func prevBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
