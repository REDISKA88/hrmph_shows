//
//  SearchDelegate.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/9/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit
//var returnedShow: Show!
// viewModel.networker.idShow = currentShow.id
// viewModel.networker.presentShowById {
//     returnedShow = self.viewModel.networker.returnedShow
// }

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ModernShowInfoVC()
//        let selectedShow = viewModel.shows.returnedShowsArray[indexPath.row].show
//        vc.show = selectedShow
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height/10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReturnedShowCell", for: indexPath) as! ReturnedShowCell
//        let currentShow = viewModel.shows.returnedShowsArray[indexPath.row].show
//        cell.titleShow.text = currentShow.name
//        guard let rating = currentShow.rating?.average else {
//            cell.ratingShow.text = "-"
//            return cell
//        }
//        cell.ratingShow.text = String(rating)
        return cell
    }
}
