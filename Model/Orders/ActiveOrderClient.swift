//
//  ActiveOrderClient.swift
//  Qreeb
//
//  Created by Admin on 9/30/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation

// MARK: - ActiveOrderClient
struct ActiveOrderClient: Codable {
    let value: Bool
    let data: DataClassActiveOrderClient
    let comment: String
}

// MARK: - DataClass
struct DataClassActiveOrderClient: Codable {
    let orders: [OrderClient]
    let paginate: Paginate
}

// MARK: - Order
struct OrderClient: Codable {
    let id: Int
    let firmName: String
    let image: String
    let orderDescription, status: String
    let hasDelivery: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case firmName = "firm_name"
        case image
        case orderDescription = "description"
        case status
        case hasDelivery = "has_delivery"
    }
}


