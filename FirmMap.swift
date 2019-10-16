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
    let value: Bool?
    let data: [DatumFirmMap]?
    let comment: String?
    
    enum CodingKeys: String, CodingKey {
        case value  = "value"
        case data = "data"
        case comment = "comment"
    }
}

// MARK: - Datum
struct DatumFirmMap: Codable {
    let id: Int?
    let lat, lng: String?
    let waitingList: Int?
    
    enum CodingKeys: String, CodingKey {
        case id  = "id"
       case lat = "lat"
        case lng = "lng"
        case waitingList = "waiting_list"
    }
}
