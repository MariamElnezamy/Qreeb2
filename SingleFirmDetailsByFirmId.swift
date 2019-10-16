//
//  SingleFirmDetailsByFirmId.swift
//  Qreeb
//
//  Created by Admin on 9/30/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation

// MARK: - DetailsByFirmID
struct DetailsByFirmID: Codable {
    let value: Bool
    let data: DataClassDetailsByFirmID
    let comment: String
}

// MARK: - DataClass
struct DataClassDetailsByFirmID: Codable {
    let id: Int
    let name: String
    let fromYou: Double
    let image: String
    let lat, lng: String
    let availableDeliveries: Int
    let dataDescription, openedFrom, openedTo: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case fromYou = "from_you"
        case image, lat, lng
        case availableDeliveries = "available_deliveries"
        case dataDescription = "description"
        case openedFrom = "opened_from"
        case openedTo = "opened_to"
    }
}
