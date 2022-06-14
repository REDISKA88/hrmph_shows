//
//  New_ShowViewModel.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 6/14/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import Foundation


final class ShowViewModel {
    
    private var show: Show
    
    init(show: Show) { self.show = show }
    
    // обработать опционалы на выход только строку
    var id: String? { "\(self.show.id)"}
    var title: String? { self.show.name }
    var language: String? { self.show.language }
    var imageURL: URL { URL(string: self.show.image?.medium ?? "")!}
    var summary: String? { self.show.summary }
    var premiered: String? { self.show.premiered }
    
    // configure genres
    var genres: [String]?
    var rating: Rating?
    var network: Network?
    var image: Image?
    
    var status: String?
    var type: String?
    var runtime: Int?
}
