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
