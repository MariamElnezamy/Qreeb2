//
//  CotactInfo.swift
//  Qreeb
//
//  Created by Admin on 10/1/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation

// MARK: - Empty
struct CotactInfo: Codable {
    let value: Bool
    let data: DataClassCotactInfo
    let comment: String
}

// MARK: - DataClass
struct DataClassCotactInfo: Codable {
    let phone, email, whatsapp: String
}

