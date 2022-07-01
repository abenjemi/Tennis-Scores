//
//  File.swift
//  Tennis Scores
//
//  Created by Amine Ben Jemia on 6/25/22.
//

import Foundation

struct Tournaments: Codable {
    var results: [Tournament]
}

struct Tournament: Codable {
    var id: Int?
    var city: String
    var country: String
    var surface: String?
    var code: String?
    var start_date: String
    var end_date: String
    var season: Int?
}
