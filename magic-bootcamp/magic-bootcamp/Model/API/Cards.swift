//
//  Cards.swift
//  magic-bootcamp
//
//  Created by Paulo Ricardo de Araujo Vieira on 16/03/21.
//

import Foundation

struct Cards: Codable {
    let cards: [Card]
}

struct Card: Codable {
    let originalText, flavor, manaCost, text: String?
    let name: String
    let cmc: Int
    let colors, colorIdentity: [String]
    let type: String
    let types: [String]
    let rarity, cardSet, setName: String
    let artist, number, layout: String
    let multiverseid: String?
    let imageURL: String?
    let foreignNames: [ForeignName]?
    let printings: [String]
    let originalType: String?
    let legalities: [Legality]
    let id: String

    enum CodingKeys: String, CodingKey {
        case name, manaCost, cmc, colors, colorIdentity, type, types, rarity
        case cardSet = "set"
        case setName, text, flavor, artist, number, layout, multiverseid
        case imageURL = "imageUrl"
        case foreignNames, printings, originalText, originalType, legalities, id
    }
}

struct ForeignName: Codable {
    let flavor, text: String?
    let name, type: String
    let imageURL: String
    let language: String
    let multiverseid: Int

    enum CodingKeys: String, CodingKey {
        case name, text, type, flavor
        case imageURL = "imageUrl"
        case language, multiverseid
    }
}

struct Legality: Codable {
    let format, legality: String
}
