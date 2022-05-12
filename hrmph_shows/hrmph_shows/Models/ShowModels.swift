//
//  PopularShow.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/12/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import Foundation

struct ImagesShowElement: Codable {
    let id: Int?
    let type: String?
    let main: Bool?
    let resolutions: Resolutions?
}

struct Resolutions: Codable {
    let original: Original?
}
struct Original: Codable {
    var url: String?
}
struct PopularShow: Codable {
    var id: Int
    var name: String
    var image: Image?
}


