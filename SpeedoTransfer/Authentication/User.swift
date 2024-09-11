//
//  User.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 30/08/2024.
//

import Foundation

struct User: Decodable {
    var id: Int
    var name: String
    var email: String
}

struct LoggedInUser : Codable {
    let id: Int
    let token: String
}
