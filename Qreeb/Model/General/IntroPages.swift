//
//  IntroPages.swift
//  Qreeb
//
//  Created by Admin on 10/8/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation

// MARK: - IntroPages
struct IntroPages: Codable {
    let value: Bool
    let data: [DatumIntroPages]
    let comment: String
}

// MARK: - Datum
struct DatumIntroPages: Codable {
    let id: Int
    let title, datumDescription, type: String
    let media: String
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case datumDescription = "description"
        case type, media
    }
}
