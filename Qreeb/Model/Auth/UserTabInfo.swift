//
//  UserTabInfo.swift
//  Qreeb
//
//  Created by Admin on 10/8/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation

// MARK: - UserTabInfo
struct UserTabInfo: Codable {
    let value: Bool
    let data: DataClassUserTabInfo
    let comment: String
}

// MARK: - DataClass
struct DataClassUserTabInfo: Codable {
    let notifications, replies, orders: Int
}
