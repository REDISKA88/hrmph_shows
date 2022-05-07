//
//  SearchVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 4/30/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class SearchVC: MainTheme {

    let sortBySegmentedControl: UISegmentedControl = {
        let sort = UISegmentedControl()
         sort.insertSegment(with: UIImage(systemName: "arrow.up.arrow.down"), at: 0, animated: false)
        sort.insertSegment(with: UIImage(systemName: "star"), at: 1, animated: false)
        sort.selectedSegmentIndex = 0
        sort.selectedSegmentTintColor = .white
        let normalColor = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let selectedColor = [NSAttributedString.Key.foregroundColor: UIColor.black]
        sort.setTitleTextAttributes(selectedColor, for:.selected)
        sort.setTitleTextAttributes(normalColor, for:.normal)
        return sort
    }()
    
    let tableView : UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        view.addSubview(sortBySegmentedControl)
        setupSearchTableView()


      //  setupTableView()
        setupSegmentedControl()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    func setupSearchTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: sortBySegmentedControl.topAnchor, constant: 0).isActive = true
        
        
        tableView.register(ReturndedShowCell.self, forCellReuseIdentifier: "ReturndedShowCell")
    }
    
    func setupSegmentedControl() {
    
        sortBySegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        sortBySegmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.size.height/1.25).isActive = true
        sortBySegmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        sortBySegmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        sortBySegmentedControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
    }


}


extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReturndedShowCell", for: indexPath) as! ReturndedShowCell
        return cell
    }
}

class ReturndedShowCell: UITableViewCell {
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
           // selectionStyle = .none
           backgroundColor = .clear
            
        }

}
