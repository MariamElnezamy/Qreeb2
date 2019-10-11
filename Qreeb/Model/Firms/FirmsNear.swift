
//
//  FirmsNear.swift
//  Qreeb
//
//  Created by Admin on 9/30/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation


// MARK: - FirmNearResppose
struct FirmNearResppose: Codable {
    let value: Bool
    let data: DataFirmNear
    let comment: String
}

// MARK: - DataClass
struct DataFirmNear: Codable {
    let firms: [FirmNear]
    let paginate: Paginate
}

// MARK: - Firm
struct FirmNear: Codable {
    let id: Int
    let name: String
    let image: String
    let address: String
    let fromYou: Double
    let details: DetailsFirmNear
    let waitingList: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, address
        case fromYou = "from_you"
        case details
        case waitingList = "waiting_list"
    }
}

// MARK: - Details
struct DetailsFirmNear: Codable {
    let id: Int
    let name: String
    let fromYou: Double
    let image: String
    let lat, lng: String
    let availableDeliveries: Int
    let detailsDescription, openedFrom, openedTo: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case fromYou = "from_you"
        case image, lat, lng
        case availableDeliveries = "available_deliveries"
        case detailsDescription = "description"
        case openedFrom = "opened_from"
        case openedTo = "opened_to"
    }
}

