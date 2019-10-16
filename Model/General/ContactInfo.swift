//
//  ContactInfo.swift
//  Qreeb
//
//  Created by Admin on 10/8/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation

// MARK: - ContactInfo
struct ContactInfo: Codable {
    let value: Bool
    let data: DataClassContactInfo
    let comment: String
}

// MARK: - DataClass
struct DataClassContactInfo: Codable {
    let phone, email, whatsapp: String
}
