//
//  APIErrorResponse.swift
//  magic-bootcamp
//
//  Created by Paulo Ricardo de Araujo Vieira on 16/03/21.
//

import Foundation

struct APIErrorResponse: Codable {
    let status: Int
    let error: String
}
