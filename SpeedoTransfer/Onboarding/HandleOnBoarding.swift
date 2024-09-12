//
//  HandleOnBoarding.swift
//  SpeedoTransfer
//
//  Created by Abdullah Silva on 12/09/2024.
import Foundation
import UIKit

struct AppManager {
    static func startApp(window: UIWindow?) {
        if let isOpendBefore = UserManager.shared().isOpendBefore {
            if isOpendBefore {
                if let isLoggedIn = UserManager.shared().isLoggedin {
                    if isLoggedIn {
                        self.goToTabBarController(window: window)
                    } else {
                        self.goToSignInVC(window: window)
                    }
                } else {
                    self.goToSignUpVC(window: window)
                }
            }
        } else {
            self.goToFirstScreenVC(window: window)
        }
    }
    
    private static func goToSignInVC(window: UIWindow?) {
        window?.rootViewController = UINavigationController(rootViewController: LoginVC())
        window?.makeKeyAndVisible()
    }
    
    private static func goToSignUpVC(window: UIWindow?) {
        window?.rootViewController = UINavigationController(rootViewController: RegisterVC())
        window?.makeKeyAndVisible()
    }

    private static func goToFirstScreenVC(window: UIWindow?) {
        window?.rootViewController = UINavigationController(rootViewController: OnboardingVC())
        window?.makeKeyAndVisible()
    }
    
    private static func goToTabBarController(window: UIWindow?) {
        window?.rootViewController = UINavigationController(rootViewController: STTabBarController())
        window?.makeKeyAndVisible()
    }
}
