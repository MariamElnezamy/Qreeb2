//
//  Delivery.swift
//  Qreeb
//
//  Created by Admin on 10/8/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation

// MARK: - Delivery
struct Delivery: Codable {
    let value: Bool
    let data: DataClassDelivery
    let comment: String
}

// MARK: - DataClass
struct DataClassDelivery: Codable {
    let notifications: [NotificationDelivery]
    let paginate: Paginate
}

// MARK: - Notification
struct NotificationDelivery: Codable {
    let id: Int
    let type, msg: String
    let orderID, offerID: Int
    let userName: String
    let isClickable, isRated: Bool
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


