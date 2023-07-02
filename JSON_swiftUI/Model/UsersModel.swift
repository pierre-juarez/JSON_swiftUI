//
//  UsersModel.swift
//  JSON_swiftUI
//
//  Created by Pierre Juarez U. on 30/06/23.
//

import Foundation

struct UsersModel: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}
