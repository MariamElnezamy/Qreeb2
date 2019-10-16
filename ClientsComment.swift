//
//  ClientsComment.swift
//  Qreeb
//
//  Created by Admin on 10/4/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation

// MARK: - ClientsComment
struct ClientsComment: Codable {
    let value: Bool
    let data: DataClassClientsComment
    let comment: String
}

// MARK: - DataClass
struct DataClassClientsComment: Codable {
    let rates: [RateClientsComment]
    let paginate: Paginate
}

// MARK: - Rate
struct RateClientsComment: Codable {
    let id: Int
    let userName: String
    let userImage: String
    let value: Int
    let comment, date, time: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case userName = "user_name"
        case userImage = "user_image"
        case value, comment, date, time
    }
}
