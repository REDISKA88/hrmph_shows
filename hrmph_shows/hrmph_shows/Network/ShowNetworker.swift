//
//  ShowNetworker.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/6/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import Foundation



class ShowNetworker {
    
    var searchRequest = "https://api.tvmaze.com/search/shows?q="
    let urlAllShows = "https://api.tvmaze.com/shows"
    let urlHomeTopShows = "https://api.tvmaze.com/shows"
    let urlPopularTonight = "https://api.tvmaze.com/shows?page=2"
    
    // * * wrap this in model classes later * *
    // -- for home view controller
    var homeTopShowsCollection: [PopularShow] = []
    var homePopularTonightShowsCollection: [Show] = []
    
    // -- for show info view controller
    var showInfoCollection: Show!
    
    // -- for search page view controller
    var searchPageCollection: [Show] = []
    
    // -- for search list view controller
    var listOfRequestedShow: [Show] = []
    
    // * * * * * * * * * * * * * * * * * * * * *
    
    func getPopularShows(complition: @escaping ()->(Void)) {
      //  print("go to http: \(urlString)")
        guard let url = URL(string: urlHomeTopShows) else {
            print("Error: URL Fail")
            complition()
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error { print(error.localizedDescription)
                print("tussuu")
            }
            do {
                let decodeData = try JSONDecoder().decode([PopularShow].self, from: data!)
                self.homeTopShowsCollection = decodeData
            } catch {
                print(error)
                print(error.localizedDescription) }
            complition()
        }
        task.resume()
    }
    
    
    
}
