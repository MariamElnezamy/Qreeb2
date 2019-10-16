//
//  ActiveOrderDelivery.swift
//  Qreeb
//
//  Created by Admin on 9/29/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation

// MARK: - ActiveOrderDelivery
struct ActiveOrderDelivery: Codable {
    let value: Bool
    let data: DataClassActiveOrderDelivery
    let comment: String
}

// MARK: - DataClass
struct DataClassActiveOrderDelivery: Codable {
    let orders: [OrderActiveOrderDelivery]
    let paginate: Paginate
}

// MARK: - Order
struct OrderActiveOrderDelivery: Codable {
    let id: Int
    let userName: String
    let image: String
    let orderDescription: String
    let distance: Double
    let time: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case userName = "user_name"
        case image
        case orderDescription = "description"
        case distance, time
    }
}


