//
//  Actor.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/17/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import Foundation

struct Actor: Codable {
    var person: Person?
    var character: Character?
}

struct Person: Codable {
    var id: Int?
    var name: String?
    var image: Image?
}

struct Character: Codable {
    var id: Int?
    var name: String?
    var image: Image?
}
