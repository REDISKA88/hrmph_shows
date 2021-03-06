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
    func getShowCast(id: String, completion: @escaping (Result<[Actor], Error>) -> (Void)) {
           
           let urlShowsCast = baseUrl + id + "/cast"
           print("SEARCH CAST = \(urlShowsCast)")
           guard let url = URL(string: urlShowsCast) else { return }
           
           dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
               if let error = error {
                   completion(.failure(error))
                   print("DataTask CAST error: \(error.localizedDescription)")
                   return
               }
               guard let response = response as? HTTPURLResponse else {
                   print("EMPTY DATA CAST")
                   return
               }
               print("CAST Response status: \(response.statusCode)")
               
               do {
                   let decoder = JSONDecoder()
                   let JSONDataCast = try decoder.decode([Actor].self, from: data!)
                   
                   DispatchQueue.main.async {
                       completion(.success(JSONDataCast))
                   }
               } catch let error {
                print("ERROR DECODING DATA CAST")
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
    
    // "?page=2"
    func getPopularShowsData(page: String, completion: @escaping (Result<[Show], Error>) -> (Void)) {
        
        let urlPopularShows = "https://api.tvmaze.com/shows" + page
        
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
