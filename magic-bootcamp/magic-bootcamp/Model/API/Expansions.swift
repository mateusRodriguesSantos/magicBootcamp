//
//  Expansions.swift
//  magic-bootcamp
//
//  Created by Paulo Ricardo de Araujo Vieira on 16/03/21.
//

import Foundation


struct Expansions: Codable {
    let expansions: [Expansion]
    
    enum CodingKeys: String, CodingKey {
        case expansions = "sets"
    }
}

// MARK: - Set
struct Expansion: Codable {
    let code, name, type, releaseDate: String
    let block, magicCardsInfoCode, mkmName, border: String?
    let mkmID: Int?
    let booster: [Booster]?
    
    enum CodingKeys: String, CodingKey {
        case code, name, type, border
        case mkmID = "mkm_id"
        case booster
        case mkmName = "mkm_name"
        case releaseDate, magicCardsInfoCode, block
    }
}

enum Booster: Codable {
    case string(String)
    case stringArray([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Booster.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Booster"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}
