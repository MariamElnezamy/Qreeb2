//
//  FinishOrderClient.swift
//  Qreeb
//
//  Created by Admin on 9/29/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation

// MARK: - FinishOrderClient
struct FinishOrderClient: Codable {
    let value: Bool
    let data: DataClassFinishClient
    let comment: String
}

// MARK: - DataClass
struct DataClassFinishClient: Codable {
    let orders: [OrderFinishClient]
    let paginate: Paginate
}

// MARK: - Order
struct OrderFinishClient: Codable {
    let id: Int
    let firmName: String
    let image: String
    let orderDescription, status: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firmName = "firm_name"
        case image
        case orderDescription = "description"
        case status
    }
}

