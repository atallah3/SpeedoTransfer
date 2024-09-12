//
//  AppDelegate.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 27/08/2024.
//
//
import UIKit
//
//@main
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    var window: UIWindow?
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        window = UIWindow(frame: UIScreen.main.bounds)
//       let rootViewController = OnboardingVC()
//        let navVC = UINavigationController(rootViewController: rootViewController )
//        window?.rootViewController = navVC
//        window?.makeKeyAndVisible()
//        return true
//    }
//}
//

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    //    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    //
    //        window = UIWindow(frame: UIScreen.main.bounds)
    //
    //        let hasSeenOnboarding = UserDefaults.standard.bool(forKey: "hasSeenOnboarding")
    //
    //        if hasSeenOnboarding {
    //            let navVC = UINavigationController(rootViewController: LoginVC())
    //            window?.rootViewController = navVC
    //        } else {
    //            let onboardingVC = OnboardingVC()
    //            let navVC = UINavigationController(rootViewController: onboardingVC)
    //            window?.rootViewController = navVC
    //        }
    //
   //window?.makeKeyAndVisible()
    //
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        AppManager.startApp(window: self.window)
        
        return true
    }
}
