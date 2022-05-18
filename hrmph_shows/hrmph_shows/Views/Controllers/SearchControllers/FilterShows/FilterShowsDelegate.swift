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
        return 3
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        let title = selectSectionName(in: section)
        return title
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header :UITableViewHeaderFooterView = UITableViewHeaderFooterView()
        header.textLabel?.textColor = .white

      //  header.contentView.backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
        header.contentView.layer.masksToBounds = true
        header.contentView.layer.cornerRadius = 20
        header.contentView.backgroundColor = #colorLiteral(red: 0.1490033269, green: 0.1490303576, blue: 0.148994863, alpha: 1)
        header.contentView.layer.backgroundColor =  #colorLiteral(red: 0.1490033269, green: 0.1490303576, blue: 0.148994863, alpha: 1)
    return header
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = numberOfSectionFields(in: section)
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FilterCell.identifier, for: indexPath) as! FilterCell
        let content = selectRowContent(in: indexPath)
        cell.setupContentLabel(with: content)
        return cell
    }
    
    
    func selectRowContent(in indexPath: IndexPath) -> String {
        switch indexPath.section {
        case 0:
            let genre = selectGenre(in: indexPath.row)
            return genre
        case 1:
            let status = selectStatus(in: indexPath.row)
            return status
        case 2:
            let type = selectType(in: indexPath.row)
            return type
            
        case 3:
            let runtime = selectRuntime(in: indexPath.row)
            return runtime
        default:
            return "Unknown content"
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
        default:
            return "Runtime"
        }
    }
    
    func numberOfSectionFields(in section: Int) -> Int {
        switch section {
        case 0:
            return 9
        case 1:
            return 4
        case 2:
            return 8
        default:
            return 3
        }
    }
    
    func selectGenre(in row: Int) -> String {
        switch row {
        case 0:
            return "Anime"
        case 1:
            return "Action"
        case 2:
            return "Adventure"
        case 3:
            return "Comedy"
        case 4:
            return "Crime"
        case 5:
            return "Drama"
        case 6:
            return "Family"
        case 7:
            return "Fantasy"
        default:
            return "Romance"
        }
    }
    
    
    func selectRuntime(in row: Int) -> String {
        switch row {
        case 0:
            return "30 min"
        case 1:
            return "30 - 60 min"
        case 2:
            return "> 60 min"
        default:
            return "Unknown runtime"
        }
    }
    
    func selectStatus(in row: Int) -> String {
        switch row {
        case 0:
            return "Running"
        case 1:
            return "Ended"
        case 2:
            return "To Be Determined"
        case 3:
            return "In Development"
        default:
            return "Unknown status"
        }
    }
    
    func selectType(in row: Int) -> String {
        switch row {
        case 0:
            return "Scripted"
        case 1:
            return "Animation"
        case 2:
            return "Documentary"
        case 3:
            return "News"
        case 4:
            return "Scripted"
        case 5:
            return "Animation"
        case 6:
            return "Documentary"
        case 7:
            return "News"
        default:
            return "Unknown type"
        }
    }
    

    
}
