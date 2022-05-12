//
//  ShowInstance.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/9/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import Foundation


struct SearchPageInstance: Codable {
    var name: String
    var language: String?
    var summary: String?
    var genres: [String]?
    var rating: Rating?
    var network: Network?
    var image: Image?
}



struct Show: Codable {
       var name: String
       var language: String?
       var summary: String?
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

