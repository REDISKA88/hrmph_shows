//
//  ModernModel.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/14/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import Foundation

// * * * * S T A G E * I I * * * *
struct ShowsData: Codable {
    let show: [Show]
}



struct Show: Codable {
    var id: Int?
    var name: String?
    var language: String?
    var summary: String?
    var premiered: String?
    var genres: [String]?
    var rating: Rating?
    var network: Network?
    var image: Image?
}

struct Rating: Codable {
    var average: Double?
}

struct Network: Codable {
    var name: String?
}

struct Image: Codable {
    var original: String?
    var medium: String?
}
