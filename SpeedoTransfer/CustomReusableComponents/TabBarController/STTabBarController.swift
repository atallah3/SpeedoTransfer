//
//  STTabBarController.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 05/09/2024.
//

import UIKit

class STTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        customizeTabBarAppearance()
    }
    

    func setupViewControllers() {
        let homeVC = HomeTransferVC()
        homeVC.view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        let transferVC = UIViewController()
        transferVC.view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        let transactionsVC = UIViewController()
        transactionsVC.view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        let cardsVC = UIViewController()
        cardsVC.view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        let moreVC = UIViewController()
        moreVC.view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        transferVC.tabBarItem = UITabBarItem(title: "Transfer", image: UIImage(named: "transfer"), tag: 1)
        transactionsVC.tabBarItem = UITabBarItem(title: "Transactions", image: UIImage(named: "transactions"), tag: 2)
        cardsVC.tabBarItem = UITabBarItem(title: "My cards", image: UIImage(named: "cards"), tag: 3)
        moreVC.tabBarItem = UITabBarItem(title: "More", image: UIImage(named: "more"), tag: 4)
        
        let controllers = [homeVC, transferVC, transactionsVC, cardsVC, moreVC]
        self.viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
    }

    
    func customizeTabBarAppearance() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = UIColor(named: "p300")
        tabBar.unselectedItemTintColor = UIColor(named: "g200")
        tabBar.isTranslucent = false
        
        tabBar.layer.cornerRadius = 20
        tabBar.layer.masksToBounds = true
        
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        tabBar.layer.shadowRadius = 10
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.masksToBounds = false
    }
}
