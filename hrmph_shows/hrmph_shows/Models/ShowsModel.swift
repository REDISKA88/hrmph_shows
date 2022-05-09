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
    
   
    func getData(complition: @escaping ()->(Void)) {
      //  print("go to http: \(urlString)")
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
