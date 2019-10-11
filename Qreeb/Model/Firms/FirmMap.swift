//
//  FirmMap.swift
//  Qreeb
//
//  Created by Admin on 9/30/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct FirmMap: Codable {
    let value: Bool
    let dataFirmMap: [DatumFirmMap]
    let comment: String
}

// MARK: - Datum
struct DatumFirmMap: Codable {
    let id: Int
    let lat, lng: String
    let waitingList: Int
    
    enum CodingKeys: String, CodingKey {
        case id, lat, lng
        case waitingList
    }
}
