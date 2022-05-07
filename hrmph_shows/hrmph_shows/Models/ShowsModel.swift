//
//  ShowsModel.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/6/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import Foundation

class TVShows {
    var urlString = "https://api.tvmaze.com/search/shows?q=girls"
    var returnedShowsArray: [ReturnedShows] = []
    struct ReturnedShows: Codable {
        var show: Show
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
    }
    
    func getData(complition: @escaping ()->(Void)) {
        print("go to http: \(urlString)")
        guard let url = URL(string: urlString) else {
            print("Error: URL Fail")
            complition()
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error { print(error.localizedDescription) }
            do {
                let decodeData = try JSONDecoder().decode([ReturnedShows].self, from: data!)
                self.returnedShowsArray = decodeData
            } catch { print(error.localizedDescription) }
            complition()
        }
        task.resume()
    }
}
