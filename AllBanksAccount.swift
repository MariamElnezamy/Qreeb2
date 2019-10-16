//
//  AllBanksAccount.swift
//  Qreeb
//
//  Created by Admin on 10/5/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation

// MARK: - AllBanksAccont
struct AllBanksAccount: Codable {
    let value: Bool
    let data: DataClassAllBanksAccont
    let comment: String
}

// MARK: - DataClass
struct DataClassAllBanksAccont: Codable {
    let bankAccounts: [BankAccount]
    let paginate: Paginate
    
    enum CodingKeys: String, CodingKey {
        case bankAccounts = "bank_accounts"
        case paginate
    }
}

// MARK: - BankAccount
struct BankAccount: Codable {
    let id: Int
    let bankName: String
    let bankImage: String
    let ownerName, accountNumber, iban: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case bankName = "bank_name"
        case bankImage = "bank_image"
        case ownerName = "owner_name"
        case accountNumber = "account_number"
        case iban
    }
}

// MARK: - Encode/decode helpers

class JSONNullAllBanksAccont: Codable, Hashable {
    
    public static func == (lhs: JSONNullAllBanksAccont, rhs: JSONNullAllBanksAccont) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNullAllBanksAccont.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
