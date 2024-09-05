//
//  AppDelegate.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 27/08/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootViewController = HOmeTransferVC()
        window?.rootViewController = rootViewController
        
        window?.makeKeyAndVisible()
        
        return true
    }
}

