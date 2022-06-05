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
        return 50
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileTableCell
        
        cell.textLabel?.textColor = UIColor.white.withAlphaComponent(0.8)
        cell.textLabel?.font = .systemFont(ofSize: 18)
        cell.accessoryType = .disclosureIndicator
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Settings"
        case 1:
            cell.textLabel?.text = "Edit Profile"
        case 2:
            cell.textLabel?.text = "Help"
        case 3:
            cell.textLabel?.text = "Logout"
        default:
            break
        }
        //cell.backgroundColor = .systemIndigo
        return cell
    }
    
}
