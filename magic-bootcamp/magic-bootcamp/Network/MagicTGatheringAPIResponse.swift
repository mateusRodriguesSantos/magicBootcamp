//
//  MagicTGatheringAPIResponse.swift
//  magic-bootcamp
//
//  Created by Paulo Ricardo de Araujo Vieira on 16/03/21.
//

import Foundation

final class MagicTGatheringAPIResponse {
    let apiReq: MagicTGatheringAPIRequest
    
    init(apiReq: MagicTGatheringAPIRequest = .init()) {
        self.apiReq = apiReq
    }
    
    /// Método de get de todas as expanções da API
    /// - Parameter completion: completion com uma lista de expanções
    func getExpansions(completion: @escaping ([Expansion]) -> Void) {
        getResponse(type: Expansions.self, pathComponent: "sets", params: [("type", "expansion")]) { (expansions) in
            guard let expansions = expansions else { return }
            completion(expansions.expansions)
        }
    }
    
    /// Método de get de todas as cartas de alguma expanção da API
    /// - Parameters:
    ///   - expansionCode: código da expanção das cartas
    ///   - completion: completion com uma lista das cartas daquela expanção
    func getCards(from expansionCode: String, completion: @escaping ([Card]) -> Void) {
        getResponse(type: Cards.self, pathComponent: "cards", params: [("set", expansionCode)]) { (cards) in
            guard let cards = cards else { return }
            completion(cards.cards)
        }
    }
    
    private func getResponse<T: Codable>(
        type: T.Type,
        pathComponent: String,
        params: [(String, String)] = [],
        completion: @escaping (T?) -> Void
    ) {
        apiReq.buildRequest(httpMethod: .GET, pathComponent: pathComponent, params: params) { (data, res, err) in
            guard let data = data else {
                completion(nil)
                return
            }
            let decodedData = try! JSONDecoder().decode(T.self, from: data)
            completion(decodedData)
        }
    }
}
