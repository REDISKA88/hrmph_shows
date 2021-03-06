//
//  ProfileVCSetupTableView.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/6/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

extension ProfileVC {
    func setupProfileTableView() {
        self.view.addSubview(profileTableView)
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.frame = self.view.frame
        profileTableView.backgroundColor = .clear
        //profileTableView.separatorColor = .clear
        // HEADER
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/8))
        //header.layer.cornerRadius = 15
        // header.backgroundColor = UIColor.systemGray5.withAlphaComponent(0.5)
        setupTableHeader(header: header)
        
        //FOOTER
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/8))
        footer.layer.cornerRadius = 35
        footer.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.1)
        // footer.backgroundColor = UIColor.systemGray6.withAlphaComponent(0.1)
        footer.addSubview(avatarImage)
        footer.addSubview(profileStatsLabelWatched)
        footer.addSubview(profileStatsLabelWatching)
        footer.addSubview(profileStatsLabelReviews)
        footer.addSubview(watchedMovies)
        footer.addSubview(watchingMovies)
        footer.addSubview(reviewsMovies)
        
        setupTableFooterAvatarImage(footer: footer)
        setupFooterProfileStatsLabels(footer: footer)
        
        //header.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.5)
        profileTableView.tableHeaderView = header
        profileTableView.tableFooterView = footer
        profileTableView.separatorColor = .clear
        profileTableView.backgroundColor = .clear
        profileTableView.showsVerticalScrollIndicator = false
        profileTableView.register(ProfileTableCell.self, forCellReuseIdentifier: "ProfileCell")
    }
    
    
    func setupTableFooterAvatarImage(footer: UIView) {
        // avatarImage.image = UIImage(named: "avatar_default2")
        avatarImage.image = UIImage(named: userAvatar)
        avatarImage.contentMode = .scaleAspectFit
        
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.topAnchor.constraint(equalTo: footer.topAnchor, constant: 10).isActive = true
        avatarImage.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: 0).isActive = true
        avatarImage.trailingAnchor.constraint(equalTo: footer.trailingAnchor, constant: -(footer.frame.size.width-100)).isActive = true
        avatarImage.bottomAnchor.constraint(equalTo: footer.bottomAnchor, constant: -10).isActive = true
    }
    
    func setupFooterProfileStatsLabels(footer: UIView) {
        watchedMovies.text = userWatched
        watchingMovies.text = userWatching
        reviewsMovies.text = userRewiews
        
        profileStatsLabelWatched.translatesAutoresizingMaskIntoConstraints = false
        profileStatsLabelWatched.topAnchor.constraint(equalTo: footer.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        profileStatsLabelWatched.leadingAnchor.constraint(equalTo: avatarImage.leadingAnchor, constant: 110).isActive = true
        profileStatsLabelWatched.bottomAnchor.constraint(equalTo: footer.bottomAnchor, constant: 40).isActive = true
        profileStatsLabelWatched.trailingAnchor.constraint(equalTo: footer.centerXAnchor, constant: 0).isActive = true
        
        
        profileStatsLabelWatching.translatesAutoresizingMaskIntoConstraints = false
        profileStatsLabelWatching.topAnchor.constraint(equalTo: footer.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        
        profileStatsLabelWatching.leadingAnchor.constraint(equalTo: profileStatsLabelWatched.leadingAnchor, constant: 100).isActive = true
        profileStatsLabelWatching.bottomAnchor.constraint(equalTo: footer.bottomAnchor, constant: 40).isActive = true
        
        
        
        profileStatsLabelReviews.translatesAutoresizingMaskIntoConstraints = false
        profileStatsLabelReviews.topAnchor.constraint(equalTo: footer.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        
        profileStatsLabelReviews.leadingAnchor.constraint(equalTo: profileStatsLabelWatching.leadingAnchor, constant: 110).isActive = true
        profileStatsLabelReviews.bottomAnchor.constraint(equalTo: footer.bottomAnchor, constant: 40).isActive = true
        
        
        watchedMovies.translatesAutoresizingMaskIntoConstraints = false
        watchedMovies.topAnchor.constraint(equalTo: footer.topAnchor, constant: 10).isActive = true
        watchedMovies.leadingAnchor.constraint(equalTo: profileStatsLabelWatched.leadingAnchor, constant: 0).isActive = true
        watchedMovies.trailingAnchor.constraint(equalTo: profileStatsLabelWatched.centerXAnchor, constant: 30).isActive = true
        watchedMovies.bottomAnchor.constraint(equalTo: profileStatsLabelWatched.centerYAnchor, constant: -10).isActive = true
        
        
        watchingMovies.translatesAutoresizingMaskIntoConstraints = false
        watchingMovies.topAnchor.constraint(equalTo: footer.topAnchor, constant: 10).isActive = true
        watchingMovies.leadingAnchor.constraint(equalTo: profileStatsLabelWatching.leadingAnchor, constant: 0).isActive = true
        watchingMovies.trailingAnchor.constraint(equalTo: profileStatsLabelWatching.centerXAnchor, constant: 30).isActive = true
        watchingMovies.bottomAnchor.constraint(equalTo: profileStatsLabelWatching.centerYAnchor, constant: -10).isActive = true
        
        
        reviewsMovies.translatesAutoresizingMaskIntoConstraints = false
        reviewsMovies.topAnchor.constraint(equalTo: footer.topAnchor, constant: 10).isActive = true
        reviewsMovies.leadingAnchor.constraint(equalTo: profileStatsLabelReviews.leadingAnchor, constant: 0).isActive = true
        reviewsMovies.trailingAnchor.constraint(equalTo: profileStatsLabelReviews.centerXAnchor, constant: 30).isActive = true
        reviewsMovies.bottomAnchor.constraint(equalTo: profileStatsLabelReviews.centerYAnchor, constant: -10).isActive = true
        
    }
    
    
    func setupTableHeader(header :UIView) {
        
        nameLabel.text = "Hello,  \(userName)!"
        header.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: header.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: 0).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -10).isActive = true
        
    }
    
}
