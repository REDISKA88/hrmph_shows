//
//  ShowInfoVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/8/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class ShowInfoVC: MainTheme {

    let topViewImage = UIImageView()
    let showTitle: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.font = .boldSystemFont(ofSize: 25)
        title.textAlignment = .center
        return title
    }()
    let showRelease: UILabel = {
        let year = UILabel()
        year.textColor = .black
        year.font = .systemFont(ofSize: 25)
        year.textAlignment = .center
        return year
    }()
    
    let showRatingImage: UIImageView = {
        let rateImage = UIImageView()
        rateImage.tintColor = .green
        rateImage.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 19, weight: .bold, scale: .large)
        rateImage.image = UIImage(systemName: "star.circle.fill", withConfiguration: config)
        rateImage.tintColor = .green
        return rateImage
    }()
    
    let showRatingCount: UILabel = {
        let count = UILabel()
        count.textColor = .green
        count.font = .boldSystemFont(ofSize: 24)
        count.textAlignment = .left
        count.translatesAutoresizingMaskIntoConstraints = false
        return count
    }()
    
    let showRatingView: UIView = {
       let rateView = UIView()
        rateView.translatesAutoresizingMaskIntoConstraints = false
        return rateView
    }()
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
       }()
    
    let showImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        //imageView.layer.masksToBounds = true
        //imageView.layer.cornerRadius = 50
        return imageView
    }()
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    let showInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemPink.withAlphaComponent(0.7)
        return view
    }()
    
    let favoriteButton: UIButton = {
        let favorite = UIButton(type: UIButton.ButtonType.custom)
        favorite.tintColor = .black
        favorite.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        favorite.setImage(UIImage(systemName: "suit.heart", withConfiguration: config), for: .normal)
        //favorite.setImage(UIImage(systemName: "suit.heart.fill", withConfiguration: config), for: .selected)
        return favorite
    }()
    
    let watchingButton: UIButton = {
        let watching = UIButton()
          watching.tintColor = .black
          watching.translatesAutoresizingMaskIntoConstraints = false
          let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
          watching.setImage(UIImage(systemName: "eye", withConfiguration: config), for: .normal)
        return watching
    }()
    
    let ratingButton: UIButton = {
        let rating = UIButton()
        rating.tintColor = .black
        rating.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        rating.setImage(UIImage(systemName: "star", withConfiguration: config), for: .normal)
        return rating
    }()
    
    let reviewButton: UIButton = {
        let review = UIButton()
        review.tintColor = .black
        review.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        review.setImage(UIImage(systemName: "pencil.circle", withConfiguration: config), for: .normal)
        return review
    }()
    
    let actionView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemIndigo.withAlphaComponent(0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .cyan
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTopBackgroundView()
        setupMainView()
        setupShowImageView()
        setupShowInfoView()
        setupActionView()
        setupScrollView()
    }
    func setupScrollView() {

    }
    func setupActionView() {
        view.addSubview(actionView)
        actionView.layer.cornerRadius = 20
        actionView.leadingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: 30).isActive = true
        actionView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -30).isActive = true
        actionView.topAnchor.constraint(equalTo: showInfoView.bottomAnchor, constant: 10).isActive = true
        actionView.bottomAnchor.constraint(equalTo: showInfoView.bottomAnchor, constant: 60).isActive = true
        
        
        actionView.addSubview(favoriteButton)
        actionView.addSubview(watchingButton)
        actionView.addSubview(ratingButton)
        actionView.addSubview(reviewButton)
        
        favoriteButton.leadingAnchor.constraint(equalTo: actionView.leadingAnchor, constant: 50).isActive = true
        favoriteButton.centerYAnchor.constraint(equalTo: actionView.centerYAnchor, constant: 0).isActive = true
        
        watchingButton.leadingAnchor.constraint(equalTo: actionView.centerXAnchor, constant: -55).isActive = true
        watchingButton.centerYAnchor.constraint(equalTo: actionView.centerYAnchor, constant: 0).isActive = true
        
        ratingButton.trailingAnchor.constraint(equalTo: actionView.centerXAnchor, constant: 55).isActive = true
        ratingButton.centerYAnchor.constraint(equalTo: actionView.centerYAnchor, constant: 0).isActive = true
        
        reviewButton.trailingAnchor.constraint(equalTo: actionView.trailingAnchor, constant: -50).isActive = true
        reviewButton.centerYAnchor.constraint(equalTo: actionView.centerYAnchor, constant: 0).isActive = true
    }
    
    func setupMainView() {
        view.addSubview(mainView)
        mainView.layer.cornerRadius = 40
        mainView.backgroundColor = UIColor.black
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: -50).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        mainView.addSubview(scrollView)
        scrollView.topAnchor.constraint(lessThanOrEqualTo: mainView.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(lessThanOrEqualTo: mainView.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(lessThanOrEqualTo: mainView.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(lessThanOrEqualTo: mainView.bottomAnchor, constant: -500).isActive = true
    }
    
    func setupShowInfoView() {
        
        view.addSubview(showInfoView)
        showInfoView.layer.cornerRadius = 30
        showInfoView.translatesAutoresizingMaskIntoConstraints = false
        showInfoView.leadingAnchor.constraint(equalTo: showImage.leadingAnchor, constant: -35).isActive = true
        showInfoView.trailingAnchor.constraint(equalTo: showImage.trailingAnchor, constant: 35).isActive = true
        showInfoView.topAnchor.constraint(equalTo: showImage.bottomAnchor, constant: 15).isActive = true
        showInfoView.bottomAnchor.constraint(equalTo: showImage.bottomAnchor, constant: 140).isActive = true
        
        
        showInfoView.addSubview(showTitle)
        showTitle.translatesAutoresizingMaskIntoConstraints = false
        showTitle.centerYAnchor.constraint(equalTo: showInfoView.topAnchor, constant: 20).isActive = true
        showTitle.centerXAnchor.constraint(equalTo: showInfoView.centerXAnchor, constant: 0).isActive = true
        showTitle.text = "Game of Thrones"
        
        showInfoView.addSubview(showRelease)
        showRelease.translatesAutoresizingMaskIntoConstraints = false
        showRelease.centerYAnchor.constraint(equalTo: showTitle.centerYAnchor, constant: 40).isActive = true
        showRelease.centerXAnchor.constraint(equalTo: showTitle.centerXAnchor, constant: 0).isActive = true
        showRelease.text = "2022"
        
        
        showInfoView.addSubview(showRatingImage)
        showInfoView.addSubview(showRatingCount)
        
    
        showRatingImage.leadingAnchor.constraint(equalTo: showRelease.leadingAnchor, constant: 0).isActive = true
        showRatingImage.centerYAnchor.constraint(equalTo: showRelease.centerYAnchor, constant: 40).isActive = true
        
        showRatingCount.text = "9.7"
        showRatingCount.leadingAnchor.constraint(equalTo: showRatingImage.leadingAnchor, constant: 35).isActive = true
        showRatingCount.centerYAnchor.constraint(equalTo: showRatingImage.centerYAnchor, constant: 0).isActive = true
        showRatingCount.trailingAnchor.constraint(equalTo: showRelease.trailingAnchor, constant: 0).isActive = true
        
        
    }
    
    
    func setupShowImageView() {
        view.addSubview(showImage)
        showImage.translatesAutoresizingMaskIntoConstraints = false
        showImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        showImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        showImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80).isActive = true
        showImage.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        showImage.image = UIImage(named: "pp1")
        showImage.contentMode = .scaleAspectFill
        showImage.layer.cornerRadius = 40
        showImage.layer.masksToBounds = true
        
        
    }
    
    func setupTopBackgroundView() {
        view.addSubview(topView)
        topView.addSubview(topViewImage)
        topView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/3)
        topViewImage.frame = topView.frame
        topViewImage.image = UIImage(named: "bg0")
        topViewImage.contentMode = .scaleAspectFill
        
        let lightBlure = UIBlurEffect(style: .regular)
        let effectView = UIVisualEffectView (effect: lightBlure)
        effectView.alpha = 0.5
        effectView.frame = topViewImage.bounds
        topViewImage.addSubview(effectView)
       
    }
    
    
}
