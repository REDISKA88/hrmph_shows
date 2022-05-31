//
//  PrepareForSelect.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 6/1/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit
extension FilterShowsVC {
    
    func prepareGenresForSelect() {
        for genre in filter.genres {
            var indexGenre: Int!
            switch genre {
            case .Anime:
                indexGenre = 0
            case .Action:
                indexGenre = 1
            case .Adventure:
                indexGenre = 2
            case .Comedy:
                indexGenre = 3
            case .Crime:
                indexGenre = 4
            case .Drama:
                indexGenre = 5
            case .Family:
                indexGenre = 6
            case .Fantasy:
                indexGenre = 7
            case .Romance:
                indexGenre = 8
            default:
                break
            }
            if indexGenre != nil {
                let path = IndexPath(row: indexGenre, section: 0)
                filterTableView.selectRow(at: path, animated: false, scrollPosition: .none)
            }
        }
    }
    
    func prepareStatusForSelect() {
        for status in filter.status {
            var indexGenre: Int!
            switch status {
            case .Running:
                indexGenre = 0
            case .Ended:
                indexGenre = 1
            case .ToBeDetermined:
                indexGenre = 2
            case .InDevelopment:
                indexGenre = 3
            default:
                break
            }
            if indexGenre != nil {
                let path = IndexPath(row: indexGenre, section: 1)
                filterTableView.selectRow(at: path, animated: false, scrollPosition: .none)
            }
        }
    }
    
    func prepareTypeForSelect() {
        for typeShow in filter.type {
            var indexGenre: Int!
            switch typeShow {
            case .Scripted:
                indexGenre = 0
            case .Animation:
                indexGenre = 1
            case .Documentary:
                indexGenre = 2
            case .News:
                indexGenre = 3
            case .AwardShow:
                indexGenre = 4
            case .Reality:
                indexGenre = 5
            case .TalkShow:
                indexGenre = 6
            default:
                break
            }
            if indexGenre != nil {
                let path = IndexPath(row: indexGenre, section: 2)
                filterTableView.selectRow(at: path, animated: false, scrollPosition: .none)
            }
        }
    }
    
    func prepareRuntimeForSelect() {
        for runtime in filter.runtime {
            var indexGenre: Int!
            switch runtime {
            case .halfHour:
                indexGenre = 0
            case .oneHour:
                indexGenre = 1
            case .overHour:
                indexGenre = 2
            default:
                break
            }
            if indexGenre != nil {
                let path = IndexPath(row: indexGenre, section: 3)
                filterTableView.selectRow(at: path, animated: false, scrollPosition: .none)
            }
        }
    }
    
    
}
