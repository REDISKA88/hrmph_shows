//
//  FilteredShow.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/18/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import Foundation

class FilteredShow {
    
    var genres: GenresShow
    var status: StatusShow
    var runtime: RuntimeShow
    var type: TypeShow
    
    init() {
        self.genres = GenresShow.none
        self.status = StatusShow.none
        self.runtime = RuntimeShow.none
        self.type = TypeShow.none
    }
    
    init(selectedGenres: GenresShow, selectedStatus: StatusShow, selectedRuntime: RuntimeShow, selectedType: TypeShow) {
        self.genres = selectedGenres
        self.status = selectedStatus
        self.runtime = selectedRuntime
        self.type = selectedType
    }
    
    
    func didSelectRowContent(in indexPath: IndexPath){
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
    
   private func didSelectGenre(in row: Int) {
        switch row {
        case 0:
            self.genres = .Anime
        case 1:
            self.genres = .Action
        case 2:
            self.genres = .Adventure
        case 3:
            self.genres = .Comedy
        case 4:
            self.genres = .Crime
        case 5:
            self.genres = .Drama
        case 6:
            self.genres = .Family
        case 7:
            self.genres = .Fantasy
        case 8:
            self.genres = .Romance
        default:
            self.genres = .none
        }
    }
    
  private func didSelectStatus(in row: Int){
        switch row {
        case 0:
            self.status =  .Running
        case 1:
            self.status =  .Ended
        case 2:
            self.status =  .ToBeDetermined
        case 3:
            self.status =  .InDevelopment
        default:
            self.status =  .none
        }
    }
    
    private func didSelectRuntime(in row: Int) {
        switch row {
        case 0:
            self.runtime = .halfHour
        case 1:
            self.runtime = .oneHour
        case 2:
            self.runtime = .overHour
        default:
            self.runtime = .none
        }
    }
    
    private func didSelectType(in row: Int){
        switch row {
        case 0:
            self.type = .Scripted
        case 1:
            self.type = .Animation
        case 2:
            self.type = .Documentary
        case 3:
            self.type = .News
        case 4:
            self.type = .AwardShow
        case 5:
            self.type = .Reality
        case 6:
            self.type = .TalkShow
        default:
            self.type = .none
        }
    }
    


}

enum GenresShow {
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
