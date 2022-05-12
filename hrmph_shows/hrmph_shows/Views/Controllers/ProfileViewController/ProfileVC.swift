//
//  ProfileVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 4/30/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class ProfileVC: MainTheme {
    
    var userName = "Raphael"
    var userWatched = "90"
    var userWatching = "10"
    var userRewiews = "20"
    var userAvatar = "person.circle.fill"
    
    var profileTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTopView()
        setupStatsView()
        setupTableView()
    }
    
    let topView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 35
        let button = UIButton()
        button.tintColor = UIColor.white.withAlphaComponent(0.3)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .light, scale: .large)
        button.setImage(UIImage(systemName: "lock.circle.fill", withConfiguration: config), for: .normal)
        button.addTarget(self, action: #selector(logoutPressed), for: .touchUpInside)
        // view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.15)
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.05)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        return view
    }()
    
    @objc func logoutPressed() {
        print("logout")
    }
    let avatarImage = UIImageView()
    let nameLabel: UILabel = {
        let name = UILabel()
        //button.sizeThatFits(CGSize(width: 100, height: 100))
        name.font = .systemFont(ofSize: 24)
        name.contentMode = .center
        name.textColor = UIColor.white.withAlphaComponent(0.9)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let profileStatsLabelWatched :UILabel = {
        let label = UILabel()
        label.text = "Watched"
        label.font = .systemFont(ofSize: 22)
        label.contentMode = .bottom
        label.textColor = UIColor.white.withAlphaComponent(0.9)
        return label
    }()
    
    let profileStatsLabelWatching :UILabel = {
        let label = UILabel()
        label.text = "Watching"
        label.font = .systemFont(ofSize: 22)
        label.contentMode = .bottom
        label.textColor = UIColor.white.withAlphaComponent(0.9)
        return label
    }()
    
    
    let profileStatsLabelReviews :UILabel = {
        let label = UILabel()
        label.text = "Reviews"
        label.font = .systemFont(ofSize: 22)
        label.contentMode = .bottom
        label.textColor = UIColor.white.withAlphaComponent(0.9)
        return label
    }()
    
    let watchedMovies :UILabel = {
        let watched = UILabel()
        watched.text = "10"
        watched.textColor = .systemOrange
        watched.font = .boldSystemFont(ofSize: 28)
        watched.textAlignment = .center
        return watched
    }()
    
    let watchingMovies :UILabel = {
        let watched = UILabel()
        watched.text = "10"
        watched.textColor = .systemGreen
        watched.font = .boldSystemFont(ofSize: 28)
        watched.textAlignment = .center
        return watched
    }()
    let favoritesMovies :UILabel = {
        let watched = UILabel()
        watched.text = "55"
        watched.textColor = .systemPurple
        watched.font = .boldSystemFont(ofSize: 28)
        watched.textAlignment = .center
        return watched
    }()
    
    let reviewsMovies :UILabel = {
        let watched = UILabel()
        watched.text = "10"
        watched.textColor = .systemBlue
        watched.font = .boldSystemFont(ofSize: 28)
        watched.textAlignment = .center
        return watched
    }()
    let statsView: UIView = {
        let view = UIView()
        
        
        let watched = UILabel()
        watched.text = "Watched"
        watched.font = .systemFont(ofSize: 19)
        watched.contentMode = .center
        watched.textColor = UIColor.white.withAlphaComponent(0.9)
        view.addSubview(watched)
        watched.translatesAutoresizingMaskIntoConstraints = false
        watched.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        watched.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        
        let watching = UILabel()
        watching.text = "Watching"
        watching.font = .systemFont(ofSize: 19)
        watching.contentMode = .center
        watching.textColor = UIColor.white.withAlphaComponent(0.9)
        view.addSubview(watching)
        watching.translatesAutoresizingMaskIntoConstraints = false
        watching.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        watching.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
        let favorites = UILabel()
        favorites.text = "Favorites"
        favorites.font = .systemFont(ofSize: 18)
        favorites.contentMode = .center
        favorites.textColor = UIColor.white.withAlphaComponent(0.9)
        favorites.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(favorites)
        favorites.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 15).isActive = true
        favorites.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
        let reviews = UILabel()
        reviews.text = "Reviews"
        reviews.font = .systemFont(ofSize: 18)
        reviews.contentMode = .center
        reviews.textColor = UIColor.white.withAlphaComponent(0.9)
        reviews.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reviews)
        reviews.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        reviews.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
        view.layer.cornerRadius = 35
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.05)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
}
