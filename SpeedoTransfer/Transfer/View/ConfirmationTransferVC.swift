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
    
    var receiver: RecieverData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        getSenderAccountData()
    }

    private func configureViewController() {
        view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        title = "Transfer"
    }
    
    private func getSenderAccountData() {
        NetworkManager.shared.getAccountDetails(accountId: 9) { [weak self] account, error in
            guard let self = self else { return }
            guard let account else { return }
            
            self.senderName.text = account.accountName
            self.senderAccNumber.text = account.accountNumber
        }
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
