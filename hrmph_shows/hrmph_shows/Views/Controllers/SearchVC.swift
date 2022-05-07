//
//  SearchVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 4/30/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class SearchVC: MainTheme {
    
    let viewModel = ShowsViewModel()
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
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.shows.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
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
        return viewModel.shows.returnedShowsArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height/10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReturndedShowCell", for: indexPath) as! ReturndedShowCell
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

class ReturndedShowCell: UITableViewCell {
    
    let titleShow: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 24)
        
        return label
    }()
    
    let ratingShow: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    let ratingBack: UIView = {
        let bg = UIView()
        //bg.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.5)
        return bg
    }()
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
           selectionStyle = .none
           backgroundColor = .clear
            
            
            addSubview(titleShow)
            addSubview(ratingBack)
            ratingBack.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.3)
            ratingBack.addSubview(ratingShow)

            titleShow.translatesAutoresizingMaskIntoConstraints = false
            titleShow.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
            titleShow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
            titleShow.trailingAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
            titleShow.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
            
            ratingBack.layer.cornerRadius = 10
            ratingBack.translatesAutoresizingMaskIntoConstraints = false
            ratingBack.topAnchor.constraint(equalTo: topAnchor, constant: frame.height/3).isActive = true
            ratingBack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -frame.height/2).isActive = true
            ratingBack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -frame.height/4).isActive = true
            ratingBack.leadingAnchor.constraint(equalTo: centerXAnchor, constant: frame.width/3).isActive = true
            
    
            
            ratingShow.translatesAutoresizingMaskIntoConstraints = false
            ratingShow.centerXAnchor.constraint(equalTo: ratingBack.centerXAnchor, constant: 0).isActive = true
            ratingShow.centerYAnchor.constraint(equalTo: ratingBack.centerYAnchor, constant: 0).isActive = true
            ratingShow.textColor = .white

            
        }

}
