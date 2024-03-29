//
//  Login.swift
//  Qreeb
//
//  Created by Admin on 10/12/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation


// MARK: - Login
struct Login: Codable {
    let value: Bool
    let data: DataClassLogin
    let comment: String
}

// MARK: - DataClass
struct DataClassLogin: Codable {
    let id, isDelivery: Int
    let name, phone, email: String
    let image: String
    let identityImage, licenseImage, carFrontImage, carBackImage: String
    let formImage: String
    let birthDate: String
    let addresses: [String]
    let gender, lng, lat: String
    let rate, isAvailable: Int
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case isDelivery = "is_delivery"
        case name, phone, email, image
        case identityImage = "identity_image"
        case licenseImage = "license_image"
        case carFrontImage = "car_front_image"
        case carBackImage = "car_back_image"
        case formImage = "form_image"
        case birthDate = "birth_date"
        case addresses, gender, lng, lat, rate
        case isAvailable = "is_available"
        case token
    }
}
