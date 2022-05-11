//
//  SearchListVCDelegate.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/11/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

extension SearchListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReturnedShowCell", for: indexPath) as! ReturnedShowCell
        let imageForCurrentCell = viewModelImages[indexPath.row]
        cell.imageShow.image = UIImage(named: imageForCurrentCell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
