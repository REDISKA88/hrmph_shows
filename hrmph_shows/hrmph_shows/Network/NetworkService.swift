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
    
    let showsDataArray: [Show] = []
    private var dataTask: URLSessionDataTask?
    
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
