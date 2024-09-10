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
        self.navigationController?.pushViewController(confirmationVC, animated: true)
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        goToFavoriteListVC()
    }
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        print("btn tapped")
        goToConfirmationScreen()
    }
}
