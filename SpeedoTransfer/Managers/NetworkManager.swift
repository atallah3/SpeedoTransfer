//
//  NetworkManager.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 11/09/2024.
//

import Foundation
import Alamofire


enum NetworkingError: Error {
    case invalidResponseFromServer
    case invalidData
}

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func registerUser(name: String, country: String, eamil: String, password: String, dateOfBirth: String,completion: @escaping (Result<User,NetworkingError>)->Void) {
        
        let parameter: [String: String] = [
            "name": name,
            "country": country ,
            "email": eamil,
            "password": password,
            "dateOfBirth": dateOfBirth
        ]
        
        AF.request("https://sha256-1f39a1226a97.onrender.com/api/v1/auth/register", method: .post, parameters: parameter, encoding: JSONEncoding.default).response { response in
            
            guard let _ = response.error else {
                completion(.failure(.invalidResponseFromServer))
                return
            }
            
            guard let data = response.data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(User.self, from: data)
                completion(.success(user))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    //reposity pattern
    
    func loginWith(email: String, password: String,completion: @escaping (Result<LoggedInUser,NetworkingError>)->Void) {
        
        AF.request("https://sha256-1f39a1226a97.onrender.com/api/v1/auth/login",method: .post,
                   parameters: ["email": email, "password":password], encoding: JSONEncoding.default).response { response in
            
//            guard let _ = response.error else {
//                completion(.failure(.invalidResponseFromServer))
//                return
//            }
            
            guard let data = response.data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(LoggedInUser.self, from: data)
                print(user.token)
                completion(.success(user))
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
}




