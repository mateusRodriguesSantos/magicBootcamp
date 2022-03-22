//
//  CardFake.swift
//  magic-bootcampTests
//
//  Created by Paulo Ricardo de Araujo Vieira on 16/03/21.
//

import Foundation
@testable import magic_bootcamp

extension Card {
    static func fake(
        originalText: String? = nil,
        flavor: String? = nil,
        manaCost: String? = "{3}{W}{W}",
        text: String? = nil,
        name: String = "Archangel Avacyn",
        cmc: Int = 5,
        colors: [String] = ["white"],
        colorIdentity: [String] = ["W"],
        type: String = "Legendary Creature — Angel",
        types: [String] = ["Creature"],
        rarity: String = "Mythic Rare",
        cardSet: String = "SOI",
        setName: String = "",
        artist: String = "James Ryman",
        number: String = "5a",
        layout: String = "double-faced",
        multiverseid: String? = "409741",
        imageURL: String? = nil,
        foreignNames: [ForeignName]? = nil,
        printings: [String] = [],
        originalType: String? = "Legendary Creature — Angel",
        legalities: [Legality] = [],
        id: String = "02ea5ddc89d7847abc77a0fbcbf2bc74e6456559"
    ) -> Card {
        
        .init(
            originalText: originalText,
            flavor: flavor,
            manaCost: manaCost,
            text: text,
            name: name,
            cmc: cmc,
            colors: colors,
            colorIdentity: colorIdentity,
            type: type,
            types: types,
            rarity: rarity,
            cardSet: cardSet,
            setName: setName,
            artist: artist,
            number: number,
            layout: layout,
            multiverseid: multiverseid,
            imageURL: imageURL,
            foreignNames: foreignNames,
            printings: printings,
            originalType: originalType,
            legalities: legalities,
            id: id)
    }
}
