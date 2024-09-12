//
//  AmountTransferVC.swift
//  SpeedoTransfer
//
//  Created by Abdullah Silva on 06/09/2024.
//

import UIKit

class AmountTransferVC: UIViewController {
    
    @IBOutlet weak var favoriteView: UIStackView!
    
    @IBOutlet weak var AmountTextField: UITextField!
    @IBOutlet weak var receiverName: UITextField!
    @IBOutlet weak var receiverAccountNumber: UITextField!
    
    var receiver: RecieverData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureFavoriteTap()
    }
    
    private func configureViewController() {
        view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        title = "Transfer"
    }
    
    private func configureFavoriteTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        favoriteView.addGestureRecognizer(tapGesture)
    }
    
    private func goToFavoriteListVC() {
        let favoriteVC = FavoriteListVC(nibName: "FavoriteListVC", bundle: nil)
        self.showBottomSheet(viewController: favoriteVC)
    }
    
    private func goToConfirmationScreen() {
        let confirmationVC = confirmationTransferVC(nibName: "confirmationTransferVC", bundle: nil)
        confirmationVC.modalPresentationStyle = .fullScreen
        confirmationVC.receiver = receiver
        self.navigationController?.pushViewController(confirmationVC, animated: true)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        goToFavoriteListVC()
    }
    
    private func setReceierData() {
        self.receiver = RecieverData(amount: AmountTextField.text ?? "0", receiverName: receiverName.text ?? "N/A" , receiverNumber: receiverAccountNumber.text ?? "0")
    }
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        setReceierData()
        goToConfirmationScreen()
    }
}
