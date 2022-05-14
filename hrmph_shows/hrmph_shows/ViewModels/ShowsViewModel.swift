//
//  ShowsViewModel.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/6/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import Foundation

class ShowsViewModel {
    var selectedShowId: Int?
    var networker = ShowNetworker()
    var shows = TVShows()
    var home = HomePageShows()
    var searchPageShows = SearchPageShows()
}

class ModernViewModel {
    private var apiService = APIService()
    private var popularShows = [Show]()
    
    func fetchPopularShows(completion: @escaping () -> ()) {
        apiService.getPopularShowsData { [weak self] (result) in
            switch result {
            case .success(let shows):
                self?.popularShows = shows
                completion()
            case .failure(let error):
                print("Eror processing json data in fecthPopularShows: \(error)")
            }
        }
    }
    
    
    func numberOfShows() -> Int {
        if popularShows.count != 0 {
            return popularShows.count
        }
        return 0
    }
    
    func showForIndex(index: Int) -> Show{
        return popularShows[index]
    }
}
