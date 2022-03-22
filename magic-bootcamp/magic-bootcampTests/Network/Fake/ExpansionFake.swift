//
//  ExpansionFake.swift
//  magic-bootcampTests
//
//  Created by Paulo Ricardo de Araujo Vieira on 16/03/21.
//

import Foundation
@testable import magic_bootcamp

extension Expansion {
    static func fake(
        code: String = "KTK",
        name: String = "Khans of Tarkir",
        type: String = "expansion",
        releaseDate: String = "2014-09-26",
        block: String = "Khans of Tarkir",
        magicCardsInfoCode: String = "ktk",
        mkmName: String = "Khans of Tarkir",
        border: String = "black",
        mkmID: Int = 1495,
        booster: [Booster] = []
    ) -> Expansion {
        
        .init(
            code: code,
            name: name,
            type: type,
            releaseDate: releaseDate,
            block: block,
            magicCardsInfoCode: magicCardsInfoCode,
            mkmName: mkmName,
            border: border,
            mkmID: mkmID,
            booster: booster)
    }
}
