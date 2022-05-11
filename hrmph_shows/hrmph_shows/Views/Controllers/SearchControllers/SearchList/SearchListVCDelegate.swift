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
        
    return viewModel.shows.returnedShowsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReturnedShowCell", for: indexPath) as! ReturnedShowCell
        let currentShow = viewModel.shows.returnedShowsArray[indexPath.row].show
        cell.titleShow.text = currentShow.name
        
        if currentShow.genres != nil {
            var list = ""
            for genre in currentShow.genres! {
                list += " \(genre), "
            }
            if list.count > 2 {
                list.removeLast()
                list.removeLast()
            }
            cell.genresShow.text = list
        }
        if let rating = currentShow.rating?.average {
            cell.ratingShow.text = "\(rating)"
        } else { cell.ratingShow.text = ""
            cell.ratingStarShow.image = UIImage()
        }
        guard let url = URL(string: currentShow.image?.original ?? "") else { return cell }
        do {
            let data = try Data(contentsOf: url)
            cell.imageShow.image = UIImage(data: data)
        } catch { print("error fail load image from url") }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ModernShowInfoVC()
        vc.show = viewModel.shows.returnedShowsArray[indexPath.row].show
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
