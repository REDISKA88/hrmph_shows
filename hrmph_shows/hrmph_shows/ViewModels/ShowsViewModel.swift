//
//  ShowsViewModel.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/6/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit
import Foundation

class ModernViewModel {
    private var apiService = APIService()
    private var popularShows = [Show]()
    var background: UIImageView?

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
    
    
    
    func fetchBackgroundShowImage(intId: Int?, back: UIImageView){
        guard let intId = intId else { return }
        let id = String(intId)
        var imageUrl: String?
        apiService.getShowBackgroundImages(id: id) { [weak self] (result) in
            switch result {
            case .success(let images):
                for image in images {
                    if image.type == "background", image.resolutions?.original?.url != nil {
                        imageUrl = image.resolutions?.original?.url
                        break
                    }
                }
                guard imageUrl != nil, let url = URL(string: imageUrl!) else { return }
                self!.getImageFrom(url: url, for: back)
            case .failure(let error):
                print("Eror processing image data in fetchBackgroundShowImage: \(error)")
            }
        }
    }
    private func getImageFrom(url: URL, for poster: UIImageView) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("load image error: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("empty image data")
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    poster.image = image
                }
            }
        }.resume()
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

//class ShowsViewModel {
//    var selectedShowId: Int?
//    var networker = ShowNetworker()
//    var shows = TVShows()
//    var home = HomePageShows()
//    var searchPageShows = SearchPageShows()
//}
