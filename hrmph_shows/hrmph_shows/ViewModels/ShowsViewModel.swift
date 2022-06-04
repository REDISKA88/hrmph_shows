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
    private var popularTonight = [Show]()
    
    private var filteredShows: [Show]!
    private var notFilteredShows: [Show]!
    
    private var favoritesShows = [Show]()
    private var watchingShows = [Show]()
    private var rateShows = [Show]()
    private var reviewShows = [Show]()
    
    private var searchShows = [ShowQueryRequest]()
    private var showCast = [Actor]()
    var background: UIImageView?
    var query: String?
    
    
    func fetchShowQueryRequest(show: String, completion: @escaping () -> ()) {
        apiService.getShowQueryRequest(query: show) { (result) in
            switch result {
            case .success(let shows):
                self.searchShows = shows
                completion()
            case .failure(let error):
                print("Eror processing json data in fetchShowQueryRequest: \(error)")
            }
        }
        apiService.getPopularShowsData(page: "") { [weak self] (result) in
            switch result {
            case .success(let shows):
                self?.popularShows = shows
                completion()
            case .failure(let error):
                print("Eror processing json data in fecthPopularShows: \(error)")
            }
        }
    }
    
    
    
    func fetchPopularShows(completion: @escaping () -> ()) {
        apiService.getPopularShowsData(page: "") { [weak self] (result) in
            switch result {
            case .success(let shows):
                self?.popularShows = shows
                completion()
            case .failure(let error):
                print("Eror processing json data in fecthPopularShows: \(error)")
            }
        }
    }
    
    func fetchPopularTonight(completion: @escaping () -> ()) {
        apiService.getPopularShowsData(page: "?page=1") { [weak self] (result) in
            switch result {
            case .success(let shows):
                self?.popularTonight = shows
                completion()
            case .failure(let error):
                print("Eror processing json data in fecthPopularShows: \(error)")
            }
        }
    }
    
    func fetchShowActorsBy(intId: Int?, completion: @escaping () -> ()){
        guard let intId = intId else { return }
        let castId = String(intId)
        apiService.getShowCast(id: castId) { [weak self] (result) in
            switch result {
            case .success(let actors):
                self?.showCast = actors
                completion()
            case .failure(let error):
                print("Eror processing json data in fetchShowActorsBy: \(error)")
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
    
    func getImageFrom(url: URL, for poster: UIImageView) {
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
    
    func addOrDeleteFavoriteShow(show: Show) -> Bool{
        for currentShow in favoritesShows.enumerated() {
            if currentShow.element.id == show.id {
                favoritesShows.remove(at: currentShow.offset)
                return false
            }
        }
        favoritesShows.append(show)
        return true
    }
    
    func addOrDeleteWatchingShow(show: Show) -> Bool{
        for currentShow in watchingShows.enumerated() {
            if currentShow.element.id == show.id {
                watchingShows.remove(at: currentShow.offset)
                return false
            }
        }
        watchingShows.append(show)
        return true
    }
    
    func showWasRated(show: Show) -> Bool{
        for currentShow in rateShows.enumerated() {
            if currentShow.element.id == show.id {
                return true
            }
        }
        return false
    }
    
    func addOrDeleteReviewShow(show: Show) -> Bool{
        for currentShow in reviewShows.enumerated() {
            if currentShow.element.id == show.id {
                reviewShows.remove(at: currentShow.offset)
                return false
            }
        }
        reviewShows.append(show)
        return true
    }
    
    func applyFiltered(with filter: FilteredShow) {
        shiftNotFilteredShows()
        var newShows = applyGenreFilter(genres: filter.genres, forShow: popularShows)
        newShows = applyStatusFilter(status: filter.status, forShow: newShows)
        newShows = applyTypeFilter(typeShow: filter.type, forShow: newShows)
        newShows = applyRuntimeFilter(runtime: filter.runtime, forShow: newShows)
        popularShows = newShows
    }
    
    private func applyGenreFilter(genres: [GenresShow], forShow: [Show]) -> [Show] {

        guard genres.count != 0 else { return forShow }
        
        var newFilteredShow = [Show]()
        
        for current in forShow {
            for gen in genres {
                if current.genres?.contains(gen.rawValue) ?? false {
                    newFilteredShow.append(current)
                    break
                }
            }
        }
        
        return newFilteredShow
    }
    
    private func applyStatusFilter(status: [StatusShow], forShow: [Show]) -> [Show] {
        guard status.count != 0 else { return forShow}
        var newFilteredShow = [Show]()
        
        for currentShow in forShow {
            for currentStatus in status {
                if let modelStatus = currentShow.status, modelStatus == currentStatus.rawValue {
                    newFilteredShow.append(currentShow)
                    break
                }
            }
        }
        return newFilteredShow
    }
    
    private func applyTypeFilter(typeShow: [TypeShow], forShow: [Show]) -> [Show] {
        guard typeShow.count != 0 else { return forShow}
        var newFilteredShow = [Show]()
        
        for currentShow in forShow {
            for currentType in typeShow {
                if let modelType = currentShow.type, modelType == currentType.rawValue {
                    newFilteredShow.append(currentShow)
                    break
                }
            }
        }
        return newFilteredShow
    }
    
    
    private func applyRuntimeFilter(runtime: [RuntimeShow], forShow: [Show]) -> [Show] {
        guard runtime.count != 0 else { return forShow}
        var newFilteredShow = [Show]()
        
        for currentShow in forShow {
            for currentRuntime in runtime {
                if let modelRuntime = currentShow.runtime, modelRuntime == currentRuntime.rawValue {
                    newFilteredShow.append(currentShow)
                    break
                }
                if currentRuntime == .overHour && currentShow.runtime ?? 0 >= 61 {
                    newFilteredShow.append(currentShow)
                    break
                }
                if currentRuntime == .halfHour && currentShow.runtime ?? 0 <= 30 {
                    newFilteredShow.append(currentShow)
                    break
                }
                
            }
        }
        return newFilteredShow
    }

    
    

    func saveNotFilteredShows() {
        print("saveNotFilteredShows")
        if notFilteredShows == nil {
            print("save with count")
            print(popularShows.count)
            notFilteredShows = popularShows
        }
    }
    func shiftNotFilteredShows() {
        if notFilteredShows != nil {
            print("shiftNotFilteredShows")
            popularShows = notFilteredShows
            print(popularShows.count)
        }
    }
    
    func sortShowsByMostPopular() {
        popularShows.sort(by: {$0.id ?? 0 < $1.id ?? 0})
    }
    
    func sortShowsByReleaseDate() {
         popularShows.sort(by: {$0.premiered ?? "0" > $1.premiered ?? "0"})
     }
    func sortShowsByRating() {
        popularShows.sort(by: {$0.rating?.average ?? 0.0 > $1.rating?.average ?? 0.0})
    }
    
    func numberOfShows() -> Int {
        if popularShows.count != 0 {
            return popularShows.count
        }
        return 0
    }

    
    func numberOfFoundShows() -> Int {
        if searchShows.count != 0 {
            return searchShows.count
        }
        return 0
    }
    func foundShowForIndex(index: Int) -> Show {
        return searchShows[index].show
    }
    
    func showForIndex(index: Int) -> Show {
        return popularShows[index]
    }
    
    func getActorByIndex(index: Int) -> Actor {
        return showCast[index]
    }
    
    func numberOfActors() -> Int {
        if showCast.count != 0 {
            return showCast.count
        }
        return 0
    }
    
    func getTonightShowByIndex(index: Int) -> Show {
        return popularTonight[index]
    }
    
    func numberOfTonightShows() -> Int {
        if popularTonight.count != 0 {
            return popularTonight.count
        }
        return 0
    }
}

extension UIViewController {
    func getImageFrom(url: URL, for poster: UIImageView) {
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
}
