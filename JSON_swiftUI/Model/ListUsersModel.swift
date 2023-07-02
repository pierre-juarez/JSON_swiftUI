//
//  ListUsersModel.swift
//  JSON_swiftUI
//
//  Created by Pierre Juarez U. on 1/07/23.
//

import Foundation

struct ListUsersModel: Decodable{
    var data: [UserList]
}

struct User: Decodable{
    var data: UserList
}

struct UserList: Decodable{
    var id: Int
    var first_name: String
    var email: String
    var avatar: String
}
