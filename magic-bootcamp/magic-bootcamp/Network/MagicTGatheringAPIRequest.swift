//
//  MagicTGatheringAPIRequest.swift
//  magic-bootcamp
//
//  Created by Paulo Ricardo de Araujo Vieira on 16/03/21.
//

import Foundation

class MagicTGatheringAPIRequest {
    let urlSession: URLSession
    let baseURL = URL(string: "https://api.magicthegathering.io/v1")!
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func buildRequest(
        httpMethod: HTTPMethod,
        pathComponent: String,
        params: [(String, String)],
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) {
        var request: URLRequest
        let url = baseURL.appendingPathComponent(pathComponent)
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        
        urlComponents.queryItems = params
            .map { URLQueryItem(name: $0.0, value: $0.1) }
        
        request = .init(url: urlComponents.url!)
        request.httpMethod = httpMethod.rawValue
        
        urlSession.dataTask(with: request) { (data, res, err) in
            completionHandler(data, res, err)
        }.resume()
    }
}
