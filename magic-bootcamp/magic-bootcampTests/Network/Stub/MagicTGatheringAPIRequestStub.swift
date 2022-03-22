//
//  MagicTGatheringAPIRequestStub.swift
//  magic-bootcampTests
//
//  Created by Paulo Ricardo de Araujo Vieira on 16/03/21.
//

import Foundation
@testable import magic_bootcamp

class MagicTGatheringAPIRequestStub: MagicTGatheringAPIRequest {
    let data: Data?
    let response: URLResponse?
    let error: Error?
    
    init(data: Data? = nil, response: URLResponse? = nil, error: Error? = nil) {
        self.data = data
        self.response = response
        self.error = error
    }
    
    override func buildRequest(
        httpMethod: HTTPMethod,
        pathComponent: String,
        params: [(String, String)],
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) {
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
            completionHandler(self.data, self.response, self.error)
            timer.invalidate()
        }
    }
}
