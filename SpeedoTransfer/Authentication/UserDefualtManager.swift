//
//  UserDefualtManager.swift
//  SpeedoTransfer
//
//  Created by Abdullah Silva on 12/09/2024.
//
import Foundation

class UserManager {
    
    // MARK: - Singelton
    static private let sharedInstance = UserManager()
    private init() {}
    
    static func shared() -> UserManager {
        return sharedInstance
    }
    
    // MARK: - Properties
    private let def = UserDefaults.standard
    
    var isLoggedin: Bool? {
        set {
            def.setValue(newValue, forKey: "isLoggedin")
        }
        get {
            if def.object(forKey: "isLoggedin") == nil {
                return nil
            }
            return def.bool(forKey: "isLoggedin")
        }
    }
    
    var isOpendBefore: Bool? {
        set {
            def.setValue(newValue, forKey: "isOpendBefore")
        }
        get {
            if def.object(forKey: "isOpendBefore") == nil {
                return nil
            }
            return def.bool(forKey: "isOpendBefore")
        }
    }
}
