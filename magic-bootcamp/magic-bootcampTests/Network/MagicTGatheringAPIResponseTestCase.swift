//
//  MagicTGatheringAPIResponseTestCase.swift
//  magic-bootcampTests
//
//  Created by Paulo Ricardo de Araujo Vieira on 16/03/21.
//

import Foundation
import XCTest
@testable import magic_bootcamp

class MagicTGatheringAPIResponseTestCase: XCTestCase {
    var result: Bool!
    var expectation: XCTestExpectation!
    
    override func setUp() {
        super.setUp()
        result = false
        expectation = .init(description: "")
    }
    
    override func tearDown() {
        result = nil
        expectation = nil
        super.tearDown()
    }
    
    func test_buildRequest_expansion() {
        let expectedCode = "5DN"
        let expansion = Expansions(expansions: [.fake(code: expectedCode)])
        let data = try? JSONEncoder().encode(expansion)
        
        let sut = MagicTGatheringAPIResponse(apiReq: MagicTGatheringAPIRequestStub(data: data))
        
        sut.getExpansions { (expansions) in
            self.result = expansions.first?.code == expectedCode
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.5)
        XCTAssertTrue(result)
    }
    
    func test_buildRequest_card() {
        let expectedName = "Bound by Moonsilver"
        let card = Cards(cards: [.fake(name: expectedName)])
        let data = try? JSONEncoder().encode(card)

        let sut = MagicTGatheringAPIResponse(apiReq: MagicTGatheringAPIRequestStub(data: data))
        
        sut.getCards(from: "SOI") { (cards) in
            self.result = cards.first?.name == expectedName
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.5)
        XCTAssertTrue(result)
    }
}
