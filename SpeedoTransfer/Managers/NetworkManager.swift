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
            
            guard let data = response.data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(User.self, from: data)
                completion(.success(user))
            } catch {
                
            }
        }
    }
    
    func loginWith(email: String, password: String,completion: @escaping (Result<LoggedInUser,NetworkingError>)->Void) {
        
        AF.request("https://sha256-1f39a1226a97.onrender.com/api/v1/auth/login",method: .post,
                   parameters: ["email": email, "password":password], encoding: JSONEncoding.default).response { response in
            
            
            guard let data = response.data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(LoggedInUser.self, from: data)
                completion(.success(user))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func getUserBalance(id: Int, token: String?, completion: @escaping (UserBalance?, Error?) -> Void) {
        
        guard let url = URL(string: "https://sha256-1f39a1226a97.onrender.com/api/v1/account/balance/\(id)") else {
            completion(nil, NetworkingError.invalidData) 
            return
        }
        var request = URLRequest(url: url)
        if let token = token {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, NetworkingError.invalidResponseFromServer)
                return
            }
            guard let data = data else {
                completion(nil, NetworkingError.invalidData)
                return
            }
            do {
                let decoder = JSONDecoder()
                let balance = try decoder.decode(UserBalance.self, from: data)
                completion(balance, nil)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getAccountDetails(accountId: Int, completion: @escaping (Account?, Error?) -> Void) {
        guard let url = URL(string: "https://sha256-1f39a1226a97.onrender.com/api/v1/account/\(accountId)") else {
            completion(nil, NetworkingError.invalidData)
            return
        }
        guard let token = UserDefaultsManager.shared.getUserData()?.token else {
            print("error in token")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(nil, NetworkingError.invalidResponseFromServer)
                return
            }
            guard let data = data else {
                completion(nil, NetworkingError.invalidData)
                return
            }

            
            do {
                let decoder = JSONDecoder()
                let account = try decoder.decode(Account.self, from: data)
                completion(account, nil)
                print(account.accountName, account.accountNumber)
            } catch {
                print(error.localizedDescription)
            }
        }

        // Start the task
        task.resume()
    }
    
}
struct Account: Decodable {
    let id: Int
    let accountNumber: String
    let balance: Int
    let accountName: String
}

struct UserBalance: Decodable {
    let balance: Int
}



