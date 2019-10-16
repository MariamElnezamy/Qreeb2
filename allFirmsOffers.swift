//
//  allFirmsOffers.swift
//  Qreeb
//
//  Created by Admin on 9/30/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation


// MARK: - FirmsOffer
struct FirmsOffer: Codable {
    let value: Bool
    let data: DataClassFirmsOffer
    let comment: String
}

// MARK: - DataClass
struct DataClassFirmsOffer: Codable {
    let offers: [OfferFirmsOffer]
    let paginate: Paginate
}

// MARK: - Offer
struct OfferFirmsOffer: Codable {
    let id: Int
    let offer: String
    let firmID: Int
    let firmName: String
    let image: String
    let address: String
    let fromYou: Double
    
    enum CodingKeys: String, CodingKey {
        case id, offer
        case firmID = "firm_id"
        case firmName = "firm_name"
        case image, address
        case fromYou = "from_you"
    }
}

