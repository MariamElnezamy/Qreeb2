//
//  FinishOrderDelivery.swift
//  Qreeb
//
//  Created by Admin on 9/30/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation


// MARK: - FinishOrderDelivery
struct FinishOrderDelivery: Codable {
    let value: Bool
    let data: DataClassFinishOrderDelivery
    let comment: String
}

// MARK: - DataClass
struct DataClassFinishOrderDelivery: Codable {
    let orders: [OrderFinishOrderDelivery]
    let paginate: Paginate
}

// MARK: - Order
struct OrderFinishOrderDelivery: Codable {
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
