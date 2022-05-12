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
        profileTableView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        profileTableView.register(ProfileTableCell.self, forCellReuseIdentifier: ProfileTableCell.identifier)
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        profileTableView.topAnchor.constraint(equalTo: statsView.bottomAnchor, constant: 20).isActive = true
        profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        profileTableView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        
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
        watchedMovies.centerYAnchor.constraint(equalTo: statsView.centerYAnchor, constant: -15).isActive = true
        watchedMovies.centerXAnchor.constraint(equalTo: statsView.centerXAnchor, constant: -(view.frame.size.width/3)).isActive = true
        
        watchingMovies.translatesAutoresizingMaskIntoConstraints = false
        watchingMovies.centerYAnchor.constraint(equalTo: statsView.centerYAnchor, constant: -15).isActive = true
        watchingMovies.centerXAnchor.constraint(equalTo: statsView.centerXAnchor, constant: -(view.frame.size.width/10)).isActive = true
        
        favoritesMovies.translatesAutoresizingMaskIntoConstraints = false
        favoritesMovies.centerYAnchor.constraint(equalTo: statsView.centerYAnchor, constant: -15).isActive = true
        favoritesMovies.centerXAnchor.constraint(equalTo: statsView.centerXAnchor, constant: view.frame.size.width/8).isActive = true
        
        reviewsMovies.translatesAutoresizingMaskIntoConstraints = false
        reviewsMovies.centerYAnchor.constraint(equalTo: statsView.centerYAnchor, constant: -15).isActive = true
        reviewsMovies.centerXAnchor.constraint(equalTo: statsView.centerXAnchor, constant: view.frame.size.width/3.2).isActive = true
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
