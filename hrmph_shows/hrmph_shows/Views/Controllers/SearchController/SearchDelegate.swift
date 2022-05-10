//
//  SearchDelegate.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/9/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit


extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ModernShowInfoVC()
        let selectedShow = viewModel.shows.returnedShowsArray[indexPath.row]
        vc.show = selectedShow.show
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.shows.returnedShowsArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height/10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReturnedShowCell", for: indexPath) as! ReturnedShowCell
        let currentShow = viewModel.shows.returnedShowsArray[indexPath.row]
        cell.titleShow.text = currentShow.show.name
        guard let rating = currentShow.show.rating?.average else {
            cell.ratingShow.text = "-"
            return cell
        }
        cell.ratingShow.text = String(rating)
        return cell
    }
}
