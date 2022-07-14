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
    var id: String { "\(self.show.id ?? 0)"}
    var title: String? { self.show.name }
    var language: String? { self.show.language }
    var imageURL: URL { URL(string: self.show.image?.medium ?? "")!}
    var summary: String? { self.show.summary }
    var premiered: String? { self.show.premiered }
    
    // configure genres
    var genres: [String]? { self.show.genres }
    var rating: String {
        if let rate = self.show.rating?.average {
            return String(rate)
        } else {
            return ""
        }
    }
    var network: String { "\(String(describing: self.show.network))"}
    var image: Image?
    var status: String?
    var type: String?
    var runtime: Int?
}
