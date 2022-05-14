//
//  ShowNetworker.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/6/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import Foundation



class ShowNetworker {
    var idShow: Int?
    var searchRequest = "https://api.tvmaze.com/search/shows?q="
    let urlAllShows = "https://api.tvmaze.com/shows"
    let urlHomeTopShows = "https://api.tvmaze.com/shows"
    let urlPopularTonight = "https://api.tvmaze.com/shows?page=0"
    var urlWhithShowId = "https://api.tvmaze.com/shows/"
    var ImagesString = "/images"
    var returnedShowImages :[ImagesShowElement] = []
    var returnedShow: Show!
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
    
    
    func presentShowById(complition: @escaping ()->(Void)) {
      //  print("go to http: \(urlString)")
        
        guard idShow != nil else { return }
        let newUrl = urlWhithShowId + "\(idShow!)"
        let newImageUrl = urlWhithShowId + "\(idShow!)" + ImagesString
        guard let url2 = URL(string: newImageUrl) else {
            print("Error: URL Fail")
            return
        }
        let session2 = URLSession.shared
        
        let task2 = session2.dataTask(with: url2) { (data, response, error) in
            if let error = error { print(error.localizedDescription)
                print("image bg1")
            }
            do {
                let decodeData = try JSONDecoder().decode([ImagesShowElement].self, from: data!)
                self.returnedShowImages = decodeData
            } catch {
                print("image bg2")
                print(error)
                print(error.localizedDescription) }
        }
        task2.resume()
        
        
        print("New URL: \(newUrl)")
        guard let url = URL(string: newUrl) else {
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
                let decodeData = try JSONDecoder().decode(Show.self, from: data!)
                self.returnedShow = decodeData
            } catch {
                print(error)
                print(error.localizedDescription) }
            complition()
        }
        task.resume()
        
    }
    
    
    func getShowImagesById(complition: @escaping ()->(Void)) {
      //  print("go to http: \(urlString)")
        
        guard idShow != nil else { return }
        let newImageUrl = urlWhithShowId + "\(idShow!)" + ImagesString
        
        print("New URL: \(newImageUrl)")
        
        guard let url = URL(string: newImageUrl) else {
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
                let decodeData = try JSONDecoder().decode([ImagesShowElement].self, from: data!)
                self.returnedShowImages = decodeData
            } catch {
                print(error)
                print(error.localizedDescription) }
            complition()
        }
        task.resume()
    }
    
    
    
}
