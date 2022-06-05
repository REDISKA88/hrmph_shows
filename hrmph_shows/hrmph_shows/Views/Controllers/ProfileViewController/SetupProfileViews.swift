//
//  SetupProfileViews.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/12/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

extension ProfileVC {
    func setupTableView() {
        view.addSubview(profileTableView)
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.layer.masksToBounds = true
        profileTableView.layer.cornerRadius = 30
        profileTableView.backgroundColor = UIColor.gray.withAlphaComponent(0.03)
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        profileTableView.separatorColor = .clear
        profileTableView.showsVerticalScrollIndicator = false
        profileTableView.register(ProfileTableCell.self, forCellReuseIdentifier: "ProfileCell")
        profileTableView.topAnchor.constraint(equalTo: statsView.bottomAnchor, constant: 20).isActive = true
        profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        profileTableView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
    }
    
    func setupStatsView() {
        view.addSubview(statsView)
        statsView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20).isActive = true
        statsView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 0).isActive = true
        statsView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0).isActive = true
        statsView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        statsView.addSubview(watchedMovies)
        statsView.addSubview(watchingMovies)
        statsView.addSubview(favoritesMovies)
        statsView.addSubview(reviewsMovies)
        
        watchedMovies.translatesAutoresizingMaskIntoConstraints = false
        watchedMovies.centerYAnchor.constraint(equalTo: statsView.centerYAnchor, constant: -UIScreen.main.bounds.width/25).isActive = true
        watchedMovies.centerXAnchor.constraint(equalTo: statsView.centerXAnchor, constant: -(view.frame.size.width/3)).isActive = true
        
        watchingMovies.translatesAutoresizingMaskIntoConstraints = false
        watchingMovies.centerYAnchor.constraint(equalTo: statsView.centerYAnchor, constant: -UIScreen.main.bounds.width/25).isActive = true
        watchingMovies.centerXAnchor.constraint(equalTo: statsView.centerXAnchor, constant: -(view.frame.size.width/10)).isActive = true
        
        favoritesMovies.translatesAutoresizingMaskIntoConstraints = false
        favoritesMovies.centerYAnchor.constraint(equalTo: statsView.centerYAnchor, constant: -UIScreen.main.bounds.width/25).isActive = true
        favoritesMovies.centerXAnchor.constraint(equalTo: statsView.centerXAnchor, constant: view.frame.size.width/8).isActive = true
        
        reviewsMovies.translatesAutoresizingMaskIntoConstraints = false
        reviewsMovies.centerYAnchor.constraint(equalTo: statsView.centerYAnchor, constant: -UIScreen.main.bounds.width/25).isActive = true
        reviewsMovies.centerXAnchor.constraint(equalTo: statsView.centerXAnchor, constant: view.frame.size.width/3.2).isActive = true
        
        
        statsView.addSubview(profileStatsLabelWatched)
        statsView.addSubview(profileStatsLabelWatching)
        statsView.addSubview(profileStatsLabelFavorites)
        statsView.addSubview(profileStatsLabelReviews)
        
        profileStatsLabelWatched.centerXAnchor.constraint(equalTo: watchedMovies.centerXAnchor, constant: 0).isActive = true
        profileStatsLabelWatched.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/5.5).isActive = true
        profileStatsLabelWatched.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/18).isActive = true
        profileStatsLabelWatched.topAnchor.constraint(equalTo: watchedMovies.bottomAnchor, constant: 5).isActive = true
        
        
        
        profileStatsLabelWatching.centerXAnchor.constraint(equalTo: watchingMovies.centerXAnchor, constant: 0).isActive = true
        profileStatsLabelWatching.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/5.5).isActive = true
        profileStatsLabelWatching.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/18).isActive = true
        profileStatsLabelWatching.topAnchor.constraint(equalTo: watchingMovies.bottomAnchor, constant: 5).isActive = true
        
        profileStatsLabelFavorites.centerXAnchor.constraint(equalTo: favoritesMovies.centerXAnchor, constant: 0).isActive = true
        profileStatsLabelFavorites.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/6).isActive = true
        profileStatsLabelFavorites.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/18).isActive = true
        profileStatsLabelFavorites.topAnchor.constraint(equalTo: favoritesMovies.bottomAnchor, constant: 5).isActive = true
        
        profileStatsLabelReviews.centerXAnchor.constraint(equalTo: reviewsMovies.centerXAnchor, constant: 0).isActive = true
        profileStatsLabelReviews.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/6).isActive = true
        profileStatsLabelReviews.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/18).isActive = true
        profileStatsLabelReviews.topAnchor.constraint(equalTo: reviewsMovies.bottomAnchor, constant: 5).isActive = true
        
        
    }
    
    func setupTopView() {
        view.addSubview(topView)
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        topView.addSubview(avatarImage)
        avatarImage.tintColor = UIColor.lightGray.withAlphaComponent(0.8)
        avatarImage.image = UIImage(systemName: userAvatar)
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10).isActive = true
        avatarImage.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 15).isActive = true
        avatarImage.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10).isActive = true
        avatarImage.trailingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 100).isActive = true
        
        topView.addSubview(nameLabel)
        nameLabel.text = "Hello,  \(userName)!"
        nameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
    }
    
}
