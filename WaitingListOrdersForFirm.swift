//
//  WaitingListOrdersForFirm.swift
//  Qreeb
//
//  Created by Admin on 9/30/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//


import Foundation

// MARK: - WaitingList
struct WaitingList: Codable {
    let value: Bool
    let data: DataClassWaitingList
    let comment: String
}

// MARK: - DataClass
struct DataClassWaitingList: Codable {
    let orders: [Order]
    let paginate: Paginate
}

// MARK: - Order
struct Order: Codable {
    let id: Int
    let userName: String
    let image: String
    let isRated: Bool
    let orderDescription: String
    let distance: Double
    let timeRange: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case userName = "user_name"
        case image
        case isRated = "is_rated"
        case orderDescription = "description"
        case distance
        case timeRange = "time_range"
    }
}

