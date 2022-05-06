//
//  ProfileVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 4/30/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftVideoBackground
class ProfileVC: UIViewController {
    
//    var avPlayer: AVPlayer!
//    var avPlayerLayer: AVPlayerLayer!
//    var paused: Bool = false
    
    var userName = "Spartan"
    var userWatched = "90"
    var userWatching = "10"
    var userRewiews = "20"
    var userAvatar = "avatar_default2"
    
    let avatarImage = UIImageView()
    let nameLabel: UILabel = {
        let name = UILabel()
        name.text = "Hello!"
        //button.sizeThatFits(CGSize(width: 100, height: 100))
        name.font = UIFont.boldSystemFont(ofSize: 35)
        name.contentMode = .left
        name.textColor = UIColor.systemPurple.withAlphaComponent(0.7)
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
    
    let reviewsMovies :UILabel = {
        let watched = UILabel()
        watched.text = "10"
        watched.textColor = .systemBlue
        watched.font = .boldSystemFont(ofSize: 28)
        watched.textAlignment = .center
        return watched
    }()
    
    
    var profileTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupProfileTableView()
        checkScrollingIsNeeded()
        playVideoOnBackground()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

    }
    
    func checkScrollingIsNeeded() {
        if profileTableView.contentSize.height > profileTableView.frame.height {
            self.profileTableView.isScrollEnabled = true;
        }
        else {
            self.profileTableView.isScrollEnabled = false;
        }
    }
    func playVideoOnBackground() {
        try? VideoBackground.shared.play(
            view: view,
            videoName: "runner",
            videoType: "mov",
            isMuted: true, darkness: 0,
            willLoopVideo: true,
            setAudioSessionAmbient: false
        )
    }

}

