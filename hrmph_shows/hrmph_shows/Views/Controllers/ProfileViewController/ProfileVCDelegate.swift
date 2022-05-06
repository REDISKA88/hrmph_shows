//
//  ProfileVCExtension.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/6/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height/6.5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileTableViewCell
        switch indexPath.row {
        case 0:
            cell.nameForCurrentCell = "Watching list"
            cell.fon.image = UIImage(named: "watchlist")
           
        case 1:
            cell.nameForCurrentCell = "Show reviews"
            cell.fon.image = UIImage(named: "reviews")
          
        case 2:
            cell.nameForCurrentCell = "Settings"
            cell.fon.image = UIImage(named: "settings")
        
        case 3:
            cell.nameForCurrentCell = "Logout"
            cell.fon.image = UIImage(named: "logout")
        default:
            cell.nameForCurrentCell = "default"
        }
      //  cell.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        return cell
    }
    
}
