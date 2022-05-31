//
//  SortingShow.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 6/1/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import Foundation

class SortingShow {
    private var sortBy: SortingType
    
    init() {
        self.sortBy = .MostPopular
    }
    
   func setupState(by state: SortingType) {
        self.sortBy = state
    }

    func generateResult() -> String {
        switch sortBy {
        case .MostPopular:
            return "Most Popular"
        case .MostFollowed:
            return "Most Followed"
        case .HighestRating:
            return "Highest Rating"
        }
    }
}


enum SortingType {
    case MostPopular
    case MostFollowed
    case HighestRating
}
