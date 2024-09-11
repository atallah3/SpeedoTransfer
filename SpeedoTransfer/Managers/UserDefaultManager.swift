//
//  UserDefaultManager.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 11/09/2024.
//

import UIKit

enum UserDefaultKeys: String{
    case userData = "userData"
}

struct UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    private init() {}
    
    func saveUserData(user: LoggedInUser) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(user)
            UserDefaults.standard.set(data, forKey: UserDefaultKeys.userData.rawValue)
        } catch {
            print("Error saving data: \(error.localizedDescription)")
        }
    }
    
    func getUserData() -> LoggedInUser? {
        guard let data = UserDefaults.standard.data(forKey: UserDefaultKeys.userData.rawValue) else {
            return nil
        }
        
        var user: LoggedInUser?
        do {
            let decoder = JSONDecoder()
            user = try decoder.decode(LoggedInUser.self, from: data)
        } catch {
            print("Error get data: \(error.localizedDescription)")
        }
        
        return user
    }
    
}
