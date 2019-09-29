//
//  Firms.swift
//  Qreeb
//
//  Created by Vortex on 9/29/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation

// MARK: - Firms
struct Firms: Codable {
    let value: Bool
    let data: DataClass
    let comment: String
}

// MARK: - DataClass
struct DataClass: Codable {
    let firms: [Firm]
    let paginate: Paginate
}

// MARK: - Firm
struct Firm: Codable {
    let id: Int
    let name: String
    let image: String
    let address: String
    let fromYou: Double
    let details: Details
    let waitingList: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, address
        case fromYou = "from_you"
        case details
        case waitingList = "waiting_list"
    }
}

// MARK: - Details
struct Details: Codable {
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

// MARK: - Paginate
struct Paginate: Codable {
    let total, count, perPage: Int
    let nextPageURL, prevPageURL: String
    let currentPage, totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case total, count
        case perPage = "per_page"
        case nextPageURL = "next_page_url"
        case prevPageURL = "prev_page_url"
        case currentPage = "current_page"
        case totalPages = "total_pages"
    }
}
