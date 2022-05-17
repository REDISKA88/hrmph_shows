//
//  TestViewController.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/14/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var modernVM = ModernViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPopularShows()
        // Do any additional setup after loading the view.
    }
    func loadPopularShows() {
        modernVM.fetchPopularShows{ [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.reloadData()
        }
        
    }

}

extension TestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modernVM.numberOfShows()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath) as! TestCell
        let thisShow = modernVM.showForIndex(index: indexPath.row)
        
        cell.setCellWithValue(thisShow)
        return cell
    }
    
    
}
