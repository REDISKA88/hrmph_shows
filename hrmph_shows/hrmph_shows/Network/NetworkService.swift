//
//  NetworkService.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/14/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import Foundation

// * * * * S T A G E * I I * * * *

class APIService {
    
    private var dataTask: URLSessionDataTask?
    private var urlString = "https://api.tvmaze.com/shows/"
    private var baseUrl = "https://api.tvmaze.com/shows/"
    
    var id: String?
  
    
    func getShowQueryRequest(query: String, completion: @escaping (Result<[ShowQueryRequest], Error>) -> (Void)) {
           
           let urlBaseRequest = "https://api.tvmaze.com/search/shows?q="
           
           guard let url = URL(string: urlBaseRequest+query) else { return }
           
           dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
               if let error = error {
                   completion(.failure(error))
                   print("DataTask error: \(error.localizedDescription)")
                   return
               }
               guard let response = response as? HTTPURLResponse else {
                   print("EMPTY DATA")
                   return
               }
               print("Response status: \(response.statusCode)")
               
               do {
                   let decoder = JSONDecoder()
                   let JSONData = try decoder.decode([ShowQueryRequest].self, from: data!)
                   
                   DispatchQueue.main.async {
                       completion(.success(JSONData))
                   }
               } catch let error {
                   completion(.failure(error))
               }
               
           }
           dataTask?.resume()
           
       }
    
    
    func getShowBackgroundImages(id: String, completion: @escaping (Result<[ImagesShowElement], Error>) -> (Void)) {
           
           let urlShowsImages = baseUrl + id + "/images"
           print("SEARCH IMAGE = \(urlShowsImages)")
           guard let url = URL(string: urlShowsImages) else { return }
           
           dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
               if let error = error {
                   completion(.failure(error))
                   print("DataTask IMAGES error: \(error.localizedDescription)")
                   return
               }
               guard let response = response as? HTTPURLResponse else {
                   print("EMPTY DATA IMAGES")
                   return
               }
               print("IMAGES Response status: \(response.statusCode)")
               
               do {
                   let decoder = JSONDecoder()
                   let JSONDataImages = try decoder.decode([ImagesShowElement].self, from: data!)
                   
                   DispatchQueue.main.async {
                       completion(.success(JSONDataImages))
                   }
               } catch let error {
                print("ERROR DECODING DATA IMAGES")
                   completion(.failure(error))
               }
               
           }
           dataTask?.resume()
           
       }
    
    
    func getPopularShowsData(completion: @escaping (Result<[Show], Error>) -> (Void)) {
        
        let urlPopularShows = "https://api.tvmaze.com/shows?page=0"
        
        guard let url = URL(string: urlPopularShows) else { return }
        
        dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("EMPTY DATA")
                return
            }
            print("Response status: \(response.statusCode)")
            
            do {
                let decoder = JSONDecoder()
                let JSONData = try decoder.decode([Show].self, from: data!)
                
                DispatchQueue.main.async {
                    completion(.success(JSONData))
                }
            } catch let error {
                completion(.failure(error))
            }
            
        }
        dataTask?.resume()
        
    }
    

    
    
}
