//
//  Client.swift
//  Qreeb
//
//  Created by Admin on 10/1/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation

// MARK: - Client
struct Client: Codable {
    let value: Bool
    let data: DataClassClient
    let comment: String
}

// MARK: - DataClass
struct DataClassClient: Codable {
    let notifications: [Notification]
    let paginate: Paginate
}

// MARK: - Notification
struct Notification: Codable {
    let id: Int
    let type, msg: String
    let orderID, offerID: Int
    let userName: String
    let isClickable: Bool
    let isRated: JSONNull?
    let userImage: String
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, type, msg
        case orderID = "order_id"
        case offerID = "offer_id"
        case userName = "user_name"
        case isClickable = "is_clickable"
        case isRated = "is_rated"
        case userImage = "user_image"
        case createdAt = "created_at"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
