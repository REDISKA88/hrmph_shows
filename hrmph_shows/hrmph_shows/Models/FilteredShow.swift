//
//  FilteredShow.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/18/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import Foundation

class FilteredShow {
    
    var genres: [GenresShow]
    var status: [StatusShow]
    var runtime: [RuntimeShow]
    var type: [TypeShow]
    
    init() {
        self.genres = [GenresShow]()
        self.status = [StatusShow]()
        self.runtime = [RuntimeShow]()
        self.type = [TypeShow]()
    }
    
    convenience init(selectedGenres: GenresShow, selectedStatus: StatusShow, selectedRuntime: RuntimeShow, selectedType: TypeShow) {
        self.init()
        self.genres.append(selectedGenres)
        self.status.append(selectedStatus)
        self.runtime.append(selectedRuntime)
        self.type.append(selectedType)
    }
    
    
    func didSelectRowContent(in indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            didSelectGenre(in: indexPath.row)
        case 1:
            didSelectStatus(in: indexPath.row)
        case 2:
            didSelectType(in: indexPath.row)
        case 3:
            didSelectRuntime(in: indexPath.row)
        default:
            return
        }
    }
    
    func didDeselectRowContent(in indexPath: IndexPath){
        switch indexPath.section {
        case 0:
            didDeselectGenre(in: indexPath.row)
        case 1:
            didDeselectStatus(in: indexPath.row)
        case 2:
            didDeselectType(in: indexPath.row)
        case 3:
            didDeselectRuntime(in: indexPath.row)
        default:
            return
        }
    }
    
    private func didDeselectGenre(in row: Int) {
        switch row {
        case 0:
            if genres.contains(.Anime) == false { return }
            let index = genres.firstIndex(of: .Anime)
            genres.remove(at: index!)
            
        case 1:
            if genres.contains(.Action) == false { return }
            let index = genres.firstIndex(of: .Action)
            genres.remove(at: index!)
        case 2:
            if genres.contains(.Adventure) == false { return }
            let index = genres.firstIndex(of: .Adventure)
            genres.remove(at: index!)
            
        case 3:
            if genres.contains(.Comedy) == false { return }
            let index = genres.firstIndex(of: .Comedy)
            genres.remove(at: index!)
            
        case 4:
            if genres.contains(.Crime) == false { return }
            let index = genres.firstIndex(of: .Crime)
            genres.remove(at: index!)
            
        case 5:
            if genres.contains(.Drama) == false { return }
            let index = genres.firstIndex(of: .Drama)
            genres.remove(at: index!)
            
        case 6:
            if genres.contains(.Family) == false { return }
            let index = genres.firstIndex(of: .Family)
            genres.remove(at: index!)
            
        case 7:
            if genres.contains(.Fantasy) == false { return }
            let index = genres.firstIndex(of: .Fantasy)
            genres.remove(at: index!)
            
        case 8:
            if genres.contains(.Romance) == false { return }
            let index = genres.firstIndex(of: .Romance)
            genres.remove(at: index!)
            
        default:
            if genres.contains(.none) == false { return }
            let index = genres.firstIndex(of: .none)
            genres.remove(at: index!)
        }
    }
    
    
    
    private func didSelectGenre(in row: Int){
        if genres.contains(.none) && genres.count == 1 {
            genres.remove(at: 0)
        }
        switch row {
        case 0:
            if genres.contains(.Anime) { return }
            self.genres.append(.Anime)
            
        case 1:
            if genres.contains(.Action) { return }
            self.genres.append(.Action)
            
        case 2:
            if genres.contains(.Adventure) { return }
            self.genres.append(.Adventure)
            
        case 3:
            if genres.contains(.Comedy) { return }
            self.genres.append(.Comedy)
            
        case 4:
            if genres.contains(.Crime) { return }
            self.genres.append(.Crime)
            
        case 5:
            if genres.contains(.Drama) { return }
            self.genres.append(.Drama)
            
        case 6:
            if genres.contains(.Family) { return }
            self.genres.append(.Family)
            
        case 7:
            if genres.contains(.Fantasy) { return }
            self.genres.append(.Fantasy)
            
        case 8:
            if genres.contains(.Romance) { return }
            self.genres.append(.Romance)
            
        default:
            if genres.contains(.none) { return }
            self.genres.append(.none)
            
        }
    }
    
    private func didSelectStatus(in row: Int) {
        if status.contains(.none) && status.count == 1 {
                status.remove(at: 0)
            }
        switch row {
        case 0:
            if status.contains(.Running) { return }
            self.status.append(.Running)
            
        case 1:
            if status.contains(.Ended) { return }
            self.status.append(.Ended)
            
        case 2:
            if status.contains(.ToBeDetermined) { return }
            self.status.append(.ToBeDetermined)
            
        case 3:
            if status.contains(.ToBeDetermined) { return }
            self.status.append(.InDevelopment)
            
        default:
            if status.contains(.none) { return }
            self.status.append(.none)

        }
    }
    
    
    private func didDeselectStatus(in row: Int){
        switch row {
        case 0:
            if status.contains(.Running) == false { return }
            let index = status.firstIndex(of: .Running)
            status.remove(at: index!)
        case 1:
            if status.contains(.Ended) == false { return }
            let index = status.firstIndex(of: .Ended)
            status.remove(at: index!)
            
        case 2:
            if status.contains(.ToBeDetermined) == false { return }
            let index = status.firstIndex(of: .ToBeDetermined)
            status.remove(at: index!)
            
        case 3:
            if status.contains(.InDevelopment) == false { return }
            let index = status.firstIndex(of: .InDevelopment)
            status.remove(at: index!)
        
        default:
            if status.contains(.none) == false { return }
            let index = status.firstIndex(of: .none)
            status.remove(at: index!)
        }
    }
    
    
    private func didDeselectRuntime(in row: Int) {
        switch row {
        case 0:
            if runtime.contains(.halfHour) == false { return }
            let index = runtime.firstIndex(of: .halfHour)
            runtime.remove(at: index!)
            
        
        case 1:
            if runtime.contains(.oneHour) == false { return }
            let index = runtime.firstIndex(of: .oneHour)
            runtime.remove(at: index!)
            
        case 2:
            if runtime.contains(.overHour) == false { return }
            let index = runtime.firstIndex(of: .overHour)
            runtime.remove(at: index!)
            
        default:
            if runtime.contains(.none) == false { return }
            let index = runtime.firstIndex(of: .none)
            runtime.remove(at: index!)
        }
    }
    
    private func didSelectRuntime(in row: Int) {
        if runtime.contains(.none) && runtime.count == 1 {
                 runtime.remove(at: 0)
             }
        switch row {
        case 0:
            if runtime.contains(.halfHour) { return }
            self.runtime.append(.halfHour)
            
        case 1:
            if runtime.contains(.oneHour) { return }
            self.runtime.append(.oneHour)
            
        case 2:
            if runtime.contains(.overHour) { return }
            self.runtime.append(.overHour)
           
        default:
            if runtime.contains(.none) { return }
            self.runtime.append(.none)
            
        }
    }
    
    private func didSelectType(in row: Int)  {
        if type.contains(.none) && type.count == 1 {
                 type.remove(at: 0)
             }
        switch row {
        case 0:
            if type.contains(.Scripted) { return }
            self.type.append(.Scripted)
            
        case 1:
            if type.contains(.Animation) { return }
            self.type.append(.Animation)
            
        case 2:
            if type.contains(.Documentary) { return }
            self.type.append(.Documentary)
            
        case 3:
            if type.contains(.News) { return }
            self.type.append(.News)
            
        case 4:
            if type.contains(.AwardShow) { return }
            self.type.append(.AwardShow)
            
        case 5:
            if type.contains(.Reality) { return }
            self.type.append(.Reality)
            
        case 6:
            if type.contains(.TalkShow) { return }
            self.type.append(.TalkShow)
            
        default:
            if type.contains(.none) { return }
            self.type.append(.none)
            
        }
    }
    
    
    private func didDeselectType(in row: Int){
        switch row {
        case 0:
            if type.contains(.Scripted) == false { return }
            let index = type.firstIndex(of: .Scripted)
            type.remove(at: index!)
            
        case 1:
            if type.contains(.Animation) == false { return }
            let index = type.firstIndex(of: .Animation)
            type.remove(at: index!)
            
        case 2:
            if type.contains(.Documentary) == false { return }
            let index = type.firstIndex(of: .Documentary)
            type.remove(at: index!)
            
        case 3:
            if type.contains(.News) == false { return }
            let index = type.firstIndex(of: .News)
            type.remove(at: index!)

        case 4:
            if type.contains(.AwardShow) == false { return }
            let index = type.firstIndex(of: .AwardShow)
            type.remove(at: index!)
     
        case 5:
            if type.contains(.Reality) == false { return }
            let index = type.firstIndex(of: .Reality)
            type.remove(at: index!)
            
        case 6:
            if type.contains(.TalkShow) == false { return }
            let index = type.firstIndex(of: .TalkShow)
            type.remove(at: index!)
            
        default:
            if type.contains(.none) == false { return }
            let index = type.firstIndex(of: .none)
            type.remove(at: index!)
        
        }
    }

}


enum cellState {
    case select
    case deselect
}
enum GenresShow: String {
    case Anime
    case Action
    case Adventure
    case Comedy
    case Crime
    case Drama
    case Family
    case Fantasy
    case Romance
    
    case none
}


enum StatusShow {
    case Running
    case Ended
    case ToBeDetermined
    case InDevelopment
    
    case none
}

enum RuntimeShow {
    case halfHour
    case oneHour
    case overHour
    
    case none
}

enum TypeShow {
    case Scripted
    case Animation
    case Documentary
    case News
    case AwardShow
    case Reality
    case TalkShow
    case Fantasy
    case Romance
    
    case none
}
