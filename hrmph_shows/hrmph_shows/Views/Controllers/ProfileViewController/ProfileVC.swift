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
    
    let openWatchView = UIView()
    let openRatingView = UIView()
    let openReviewView = UIView()
    
    let openWatchBtn = UIButton()
    let openRatingBtn = UIButton()
    let openReviewBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTopView()
        setupStatsView()
        setupTableView()
        setupButtons()
        profileTableView.alwaysBounceVertical = false;
    }
    
    func setupButtons() {
        view.addSubview(openWatchView)
        view.addSubview(openRatingView)
        view.addSubview(openReviewView)
        openRatingView.translatesAutoresizingMaskIntoConstraints = false
        openRatingView.heightAnchor.constraint(equalTo: openWatchView.heightAnchor).isActive = true
        openRatingView.widthAnchor.constraint(equalTo: openWatchView.widthAnchor).isActive = true
        openRatingView.topAnchor.constraint(equalTo: openWatchView.topAnchor).isActive = true
        openRatingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        openRatingView.setupOpenView(for: .rating)

        openWatchView.translatesAutoresizingMaskIntoConstraints = false
        openWatchView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/3.3).isActive = true
        openWatchView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/3.3).isActive = true
        openWatchView.topAnchor.constraint(equalTo: profileTableView.bottomAnchor, constant: 20).isActive = true
        openWatchView.trailingAnchor.constraint(equalTo: openRatingView.leadingAnchor, constant: -10).isActive = true
        
        openWatchView.setupOpenView(for: .watch)
        

        
        openReviewView.translatesAutoresizingMaskIntoConstraints = false
        openReviewView.heightAnchor.constraint(equalTo: openWatchView.heightAnchor).isActive = true
        openReviewView.widthAnchor.constraint(equalTo: openWatchView.widthAnchor).isActive = true
        openReviewView.topAnchor.constraint(equalTo: openWatchView.topAnchor).isActive = true
        openReviewView.leadingAnchor.constraint(equalTo: openRatingView.trailingAnchor, constant: 10).isActive = true
        
        openReviewView.setupOpenView(for: .review)
        
        
        

        openWatchView.addSubview(openWatchBtn)
        
        openWatchBtn.addTarget(self, action: #selector(openWatchBtnPressed), for: .touchUpInside)
        openWatchBtn.translatesAutoresizingMaskIntoConstraints = false

        openWatchBtn.heightAnchor.constraint(equalTo: openWatchView.heightAnchor).isActive = true
        openWatchBtn.widthAnchor.constraint(equalTo: openWatchView.widthAnchor).isActive = true
        
        
        openRatingView.addSubview(openRatingBtn)
        
        openRatingBtn.addTarget(self, action: #selector(openRatingBtnPressed), for: .touchUpInside)
        openRatingBtn.translatesAutoresizingMaskIntoConstraints = false

        openRatingBtn.heightAnchor.constraint(equalTo: openRatingView.heightAnchor).isActive = true
        openRatingBtn.widthAnchor.constraint(equalTo: openRatingView.widthAnchor).isActive = true
        
        openReviewView.addSubview(openReviewBtn)
        
        openReviewBtn.addTarget(self, action: #selector(openReviewBtnPressed), for: .touchUpInside)
        openReviewBtn.translatesAutoresizingMaskIntoConstraints = false

        openReviewBtn.heightAnchor.constraint(equalTo: openReviewView.heightAnchor).isActive = true
        openReviewBtn.widthAnchor.constraint(equalTo: openReviewView.widthAnchor).isActive = true

    }
    
    @objc func openWatchBtnPressed() {
        print("press open watch")
    }
    @objc func openRatingBtnPressed() {
        print("press open rate")
    }
    @objc func openReviewBtnPressed() {
        print("press open review")
    }
    
    let topView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 35
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.03)
        let button = UIButton()
        
        
        button.tintColor = UIColor.white.withAlphaComponent(0.3)
        button.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .light, scale: .large)
        button.setImage(UIImage(systemName: "lock.circle.fill", withConfiguration: config), for: .normal)
        button.addTarget(self, action: #selector(logoutPressed), for: .touchUpInside)
        // view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.15)
        
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
        label.text = "Watched "
        label.font = .systemFont(ofSize: 19)
        label.contentMode = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = UIColor.white.withAlphaComponent(0.9)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileStatsLabelWatching :UILabel = {
        let label = UILabel()
        label.text = "Watching "
        label.font = .systemFont(ofSize: 19)
        label.contentMode = .center
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white.withAlphaComponent(0.9)
        return label
    }()
    
    
    let profileStatsLabelReviews :UILabel = {
        let label = UILabel()
        label.text = "Reviews "
        label.font = .systemFont(ofSize: 19)
        label.contentMode = .center
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white.withAlphaComponent(0.9)
        return label
    }()
    
    let profileStatsLabelFavorites :UILabel = {
        let label = UILabel()
        label.text = "Favorites"
        label.font = .systemFont(ofSize: 19)
        label.contentMode = .center
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
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
        
        view.layer.cornerRadius = 35
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.03)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
}
enum OpenViewType {
    case watch
    case rating
    case review
}

extension UIView {
    func setupOpenView(for typeV: OpenViewType) {
      
        var imageName: String!
        var imageColor: UIColor!
        var listnameText: String!
    
        switch typeV {
        case .watch:
            imageName = "eye"
            imageColor = .green
            listnameText = "Watch List"
        case .rating:
            imageName = "star.lefthalf.fill"
            imageColor = .yellow
            listnameText = "Rating List"
        case .review:
        imageName = "pencil.and.outline"
        imageColor = .purple
        listnameText = "Review List"
        }
        
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.03)
        self.layer.cornerRadius = 20
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: imageName)
        image.tintColor = imageColor
        self.addSubview(image)

        image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: UIScreen.main.bounds.width/12).isActive = true
        image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UIScreen.main.bounds.width/12).isActive = true
        image.topAnchor.constraint(equalTo: self.topAnchor, constant: UIScreen.main.bounds.width/80).isActive = true
        image.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -UIScreen.main.bounds.width/5.5).isActive = true
        
        let openLabel = UILabel()
        openLabel.text = "Open"
        openLabel.textAlignment = .center
        openLabel.font = .systemFont(ofSize: 18)
        openLabel.textColor = UIColor.white.withAlphaComponent(0.8)
        openLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(openLabel)
        openLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        openLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: UIScreen.main.bounds.width/80).isActive = true
        
        let listLabel = UILabel()
        listLabel.text = listnameText
        listLabel.textAlignment = .center
        listLabel.font = .systemFont(ofSize: 18)
        listLabel.textColor = UIColor.white.withAlphaComponent(0.8)
        listLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(listLabel)
        listLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        listLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -UIScreen.main.bounds.width/20).isActive = true
    }
    
}
