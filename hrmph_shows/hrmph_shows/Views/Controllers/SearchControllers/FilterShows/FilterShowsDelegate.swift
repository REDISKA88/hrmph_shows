//
//  FilterShowsDelegate.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/18/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

extension FilterShowsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        let title = selectSectionName(in: section)
        return title
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor.white.withAlphaComponent(0.8)
        header.contentView.backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        header.textLabel?.frame = header.bounds
        header.textLabel?.textAlignment = .center
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = numberOfSectionFields(in: section)
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FilterCell.identifier, for: indexPath) as! FilterCell
        let content = selectRowContent(in: indexPath)
        cell.setupContent(with: content.0, type: content.1)
//        if content.1 == .select {
//            print("!!!!!!! SELECTED")
//            cell.reloadCell()
//        }
        print("***********************************")
        print(filter.genres)
        print(filter.status)
        print(filter.type)
        print(filter.runtime)
        print("***********************************")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        filter.didSelectRowContent(in: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: FilterCell.identifier, for: indexPath) as! FilterCell
        cell.reloadCell()
        print("++++++++++++++++++++++++++++++")
        print(filter.genres)
        print(filter.status)
        print(filter.type)
        print(filter.runtime)
        print("++++++++++++++++++++++++++++++")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        filter.didDeselectRowContent(in: indexPath)
        print("--------------------------------")
        print(filter.genres)
        print(filter.status)
        print(filter.type)
        print(filter.runtime)
        print("--------------------------------")
        
    }
    
    func selectRowContent(in indexPath: IndexPath) -> (String, cellState) {
        switch indexPath.section {
        case 0:
            return selectGenre(in: indexPath.row)
        case 1:
            return selectStatus(in: indexPath.row)
        case 2:
            return selectType(in: indexPath.row)
            
        case 3:
            return selectRuntime(in: indexPath.row)
        default:
            return ("Unknown content", .deselect)
        }
    }
    

    
    
    func selectSectionName(in section: Int) -> String {
        switch section {
        case 0:
            return "Genre"
        case 1:
            return "Show Status"
        case 2:
            return "Show Type"
        case 3:
            return "Runtime"
        default:
            return "Unknown Section"
        }
    }
    
    func numberOfSectionFields(in section: Int) -> Int {
        switch section {
        case 0:
            return 9
        case 1:
            return 4
        case 2:
            return 7
        case 3:
            return 3
        default:
            return 1
        }
    }
    
    func selectGenre(in row: Int) -> (String, cellState) {
        switch row {
        case 0:
            if filter.genres.contains(.Anime) { return ("Anime", .select) }
            return ("Anime", .deselect)
        case 1:
            if filter.genres.contains(.Action) { return ("Anime", .select) }
            return ("Action", .deselect)
        case 2:
            if filter.genres.contains(.Action) { return ("Adventure", .select) }
            return ("Adventure", .deselect)
        case 3:
             if filter.genres.contains(.Action) { return ("Comedy", .select) }
             return ("Comedy", .deselect)
        case 4:
            if filter.genres.contains(.Action) { return ("Crime", .select) }
            return ("Crime", .deselect)
        case 5:
            if filter.genres.contains(.Action) { return ("Drama", .select) }
            return ("Drama", .deselect)
        case 6:
             if filter.genres.contains(.Action) { return ("Family", .select) }
             return ("Family", .deselect)
        case 7:
            if filter.genres.contains(.Action) { return ("Fantasy", .select) }
            return ("Fantasy", .deselect)
        case 8:
            if filter.genres.contains(.Action) { return ("Romance", .select) }
            return ("Romance", .deselect)
        default:
            return ("Unknown genre", .deselect)
        }
    }
    

    
    
    func selectRuntime(in row: Int) -> (String, cellState) {
        switch row {
        case 0:
            if filter.runtime.contains(.halfHour) == false { return ("30 min", .select ) }
            return ("30 min", .deselect)
        case 1:
            if filter.runtime.contains(.oneHour) == false { return ("30 - 60 min", .select ) }
            return ("30 - 60 min", .deselect)
        case 2:
             if filter.runtime.contains(.overHour) == false { return (">  60 min", .select ) }
             return (">  60 min", .deselect)
        default:
            return ("Unknown runtime", .deselect)
        }
    }
    
    func selectStatus(in row: Int) -> (String, cellState) {
        switch row {
        case 0:
            if filter.status.contains(.Running) == false { return ("Running", .select ) }
            return ("Running", .deselect)
        case 1:
            if filter.status.contains(.Ended) == false { return ("Ended", .select ) }
            return ("Ended", .deselect)
        case 2:
             if filter.status.contains(.ToBeDetermined) == false { return ("To Be Determined", .select ) }
             return ("To Be Determined", .deselect)
        case 3:
             if filter.status.contains(.InDevelopment) == false { return ("In Development", .select ) }
            return ("In Development", .deselect)
        default:
            return ("Unknown status", .deselect)
        }
    }
    
    func selectType(in row: Int) -> (String, cellState) {
        switch row {
        case 0:
            if filter.type.contains(.Scripted) == false { return ("Scripted", .select) }
            return ("Scripted", .deselect)
        case 1:
            if filter.type.contains(.Animation) == false { return ("Animation", .select) }
            return ("Animation", .deselect)
        case 2:
            if filter.type.contains(.Documentary) == false { return ("Documentary", .select) }
            return ("Documentary", .deselect)
        case 3:
            if filter.type.contains(.News) == false { return ("News", .select) }
            return ("News", .deselect)
        case 4:
            if filter.type.contains(.AwardShow) == false { return ("Award Show", .select) }
            return ("Award Show", .deselect)
        case 5:
            if filter.type.contains(.Reality) == false { return ("Reality", .select) }
            return ("Reality", .deselect)
        case 6:
            if filter.type.contains(.TalkShow) == false { return ("Talk Show", .select) }
            return ("Talk Show", .deselect)
        default:
            return ("Unknown type", .deselect)
        }
    }
    
    
    
}
