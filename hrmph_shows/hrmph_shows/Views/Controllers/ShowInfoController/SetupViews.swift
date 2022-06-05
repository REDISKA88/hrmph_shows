//
//  SetupViews.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/9/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit
extension ModernShowInfoVC {
    func setupGenresShow() {
        bottomView.addSubview(genresShow)
        genresShow.topAnchor.constraint(equalTo: castShow.bottomAnchor, constant: 10).isActive = true
        genresShow.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30).isActive = true
        genresShow.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -30).isActive = true
        genresShow.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    func setupCastCollectionView() {
        bottomView.addSubview(castShow)
        castShow.delegate = self
        castShow.dataSource = self
        castShow.backgroundColor = .clear
        castShow.layer.cornerRadius = 20
        castShow.backgroundColor = UIColor.darkGray.withAlphaComponent(0.1)
        castShow.topAnchor.constraint(equalTo: middleView.bottomAnchor, constant: 10).isActive = true
        castShow.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 10).isActive = true
        castShow.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -10).isActive = true
        castShow.heightAnchor.constraint(equalToConstant: 160).isActive = true
    }
    
    func setupSummaryTextView() {
        bottomView.addSubview(summaryShow)
      //  summaryShow.text = "Based on the bestselling book series A Song of Ice and Fire by George R.R. Martin, this sprawling new HBO drama is set in a world where summers span decades and winters can last a lifetime. From the scheming south and the savage eastern lands, to the frozen north and ancient Wall that protects the realm from the mysterious darkness beyond, the powerful families of the Seven Kingdoms are locked in a battle for the Iron Throne. This is a story of duplicity and treachery, nobility and honor, conquest and triumph. In the Game of Thrones, you either win or you die."
        summaryShow.topAnchor.constraint(equalTo: genresShow.bottomAnchor, constant: 10).isActive = true
        summaryShow.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30).isActive = true
        summaryShow.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -30).isActive = true
        summaryShow.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: 0).isActive = true
    }
    
    func setupActionView() {
        middleView.addSubview(actionView)
        actionView.layer.cornerRadius = 20
        actionView.leadingAnchor.constraint(lessThanOrEqualTo: middleView.leadingAnchor, constant: 30).isActive = true
        actionView.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -30).isActive = true
        actionView.topAnchor.constraint(lessThanOrEqualTo: middleView.centerYAnchor, constant: 50).isActive = true
        actionView.bottomAnchor.constraint(lessThanOrEqualTo: middleView.bottomAnchor, constant: -10).isActive = true
        actionView.addSubview(favoriteButton)
        actionView.addSubview(watchingButton)
        actionView.addSubview(ratingButton)
        actionView.addSubview(reviewButton)
        favoriteButton.tag = 1
        favoriteButton.leadingAnchor.constraint(equalTo: actionView.leadingAnchor, constant: 50).isActive = true
        favoriteButton.centerYAnchor.constraint(equalTo: actionView.centerYAnchor, constant: 0).isActive = true
        
        watchingButton.tag = 2
        watchingButton.leadingAnchor.constraint(equalTo: actionView.centerXAnchor, constant: -55).isActive = true
        watchingButton.centerYAnchor.constraint(equalTo: actionView.centerYAnchor, constant: 0).isActive = true
        
        ratingButton.tag = 3
        ratingButton.trailingAnchor.constraint(equalTo: actionView.centerXAnchor, constant: 55).isActive = true
        ratingButton.centerYAnchor.constraint(equalTo: actionView.centerYAnchor, constant: 0).isActive = true
        reviewButton.tag = 4
        reviewButton.trailingAnchor.constraint(equalTo: actionView.trailingAnchor, constant: -50).isActive = true
        reviewButton.centerYAnchor.constraint(equalTo: actionView.centerYAnchor, constant: 0).isActive = true
    }
    
    private func checkButtonsState() {
        if showInfoVM.showWasRated(show: show) != nil {
            activateButton(button: ratingButton, enable: true)
        }
        if showInfoVM.showWasLove(id: show.id ?? -1) {
            activateButton(button: favoriteButton, enable: true)
        }
        
        if showInfoVM.showWasWatched(id: show.id ?? -1) {
            activateButton(button: watchingButton, enable: true)
        }
        
        if showInfoVM.showWasReviewed(id: show.id ?? -1) != nil {
            print("review::")
            print(activateButton(button: reviewButton, enable: true))
            activateButton(button: reviewButton, enable: true)
        }
    }
    
    func setupActionButtons() {
        
        checkButtonsState()
        favoriteButton.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)
        watchingButton.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)
        ratingButton.addTarget(self, action: #selector(rateButtonPressed), for: .touchUpInside)
        reviewButton.addTarget(self, action: #selector(reviewButtonPressed), for: .touchUpInside)
 
    }
    
    @objc func reviewButtonPressed(button: UIButton) {
        guard let showId = show.id else { return }
        let vc = ReviewShowVC()
        vc.delegate = self
        vc.id = showId
        vc.review = showInfoVM.showWasReviewed(id: showId)
        self.present(vc, animated: true)
    }
    
    @objc func rateButtonPressed(button: UIButton) {
        openRateVC()
        if showInfoVM.showWasRated(show: show) != nil {
            activateButton(button: button, enable: true)
        } else {
            activateButton(button: button, enable: false)
        }
       }
    
    @objc func actionButtonPressed(button: UIButton) {
        let status = selectActionButton(button)
        activateButton(button: button, enable: status)
    }
    
    func selectActionButton(_ button: UIButton) -> Bool {
        switch button.tag {
            case 1:
                return showInfoVM.addOrDeleteFavoriteShow(show: show)
            case 2:
                return showInfoVM.addOrDeleteWatchingShow(show: show)
            default:
                return false
            
        }
    }
    
    func openRateVC() {
        guard let showId = show.id else { return }
        let rateVC = RateShowVC()
        let showRating = showInfoVM.showWasRated(show: show)
        rateVC.delegate = self
        rateVC.id = showId
        rateVC.rating = showRating
        rateVC.modalPresentationStyle = .overFullScreen
        rateVC.isModalInPresentation = true
        self.present(rateVC, animated: true)
    }
    
    func activateButton(button: UIButton, enable: Bool) {
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .light, scale: .large)
        if enable {
            switch button.tag {
            case 1:
                button.tintColor = .systemRed
                button.setImage(UIImage(systemName: "suit.heart.fill", withConfiguration: config), for: .normal)
            case 2:
                button.tintColor = .systemGreen
                button.setImage(UIImage(systemName: "eye.fill", withConfiguration: config), for: .normal)
                
            case 3:
                button.tintColor = .systemYellow
                button.setImage(UIImage(systemName: "star.fill", withConfiguration: config), for: .normal)
                
            case 4:
                button.tintColor = .systemBlue
                button.setImage(UIImage(systemName: "pencil.circle.fill", withConfiguration: config), for: .normal)
                
            default:
                break
            }
        } else {
            button.tintColor = .white
            switch button.tag {
            case 1:
                button.setImage(UIImage(systemName: "suit.heart", withConfiguration: config), for: .normal)
            case 2:
                button.setImage(UIImage(systemName: "eye", withConfiguration: config), for: .normal)
            case 3:
                button.setImage(UIImage(systemName: "star", withConfiguration: config), for: .normal)
            case 4:
                button.setImage(UIImage(systemName: "pencil.circle", withConfiguration: config), for: .normal)
            default:
                break
            }
        }
    }
    
    
    func setupScrollView() {
        scrollView.addSubview(backButton)
        
        backButton.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        backButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
       
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupScrollViewContainer() {
        
        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
    }
    
    func setupTopView() {
        topVeiw.addSubview(showImage)
        showImage.translatesAutoresizingMaskIntoConstraints = false
        showImage.topAnchor.constraint(equalTo: topVeiw.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        showImage.leadingAnchor.constraint(equalTo: topVeiw.leadingAnchor, constant: 80).isActive = true
        showImage.trailingAnchor.constraint(equalTo: topVeiw.trailingAnchor, constant: -80).isActive = true
        showImage.bottomAnchor.constraint(equalTo: topVeiw.bottomAnchor, constant: 0).isActive = true
      //  showImage.image = UIImage(named: "pp1")
        showImage.contentMode = .scaleAspectFill
        showImage.layer.cornerRadius = 40
        showImage.layer.masksToBounds = true
    }
    
    func setupMiddleView() {
        middleView.addSubview(showInfoView)
        showInfoView.layer.cornerRadius = 30
        showInfoView.translatesAutoresizingMaskIntoConstraints = false
        showInfoView.leadingAnchor.constraint(equalTo: showImage.leadingAnchor, constant: -35).isActive = true
        showInfoView.trailingAnchor.constraint(equalTo: showImage.trailingAnchor, constant: 35).isActive = true
        showInfoView.topAnchor.constraint(equalTo: showImage.bottomAnchor, constant: 15).isActive = true
        showInfoView.bottomAnchor.constraint(equalTo: showImage.bottomAnchor, constant: 150).isActive = true
        
        showInfoView.addSubview(showTitle)
        showTitle.translatesAutoresizingMaskIntoConstraints = false
        showTitle.centerYAnchor.constraint(equalTo: showInfoView.topAnchor, constant: 20).isActive = true
        showTitle.centerXAnchor.constraint(equalTo: showInfoView.centerXAnchor, constant: 0).isActive = true
       // showTitle.text = "Game of Thrones"
        
        showInfoView.addSubview(showRelease)
        showRelease.translatesAutoresizingMaskIntoConstraints = false
        showRelease.centerYAnchor.constraint(equalTo: showTitle.centerYAnchor, constant: 40).isActive = true
        showRelease.centerXAnchor.constraint(equalTo: showTitle.centerXAnchor, constant: 0).isActive = true
      //  showRelease.text = "2022"
        
        
        showInfoView.addSubview(showRatingImage)
        showInfoView.addSubview(showRatingCount)
        
        
        showRatingImage.leadingAnchor.constraint(equalTo: showRelease.leadingAnchor, constant: 0).isActive = true
        showRatingImage.centerYAnchor.constraint(equalTo: showRelease.centerYAnchor, constant: 40).isActive = true
        
      //  showRatingCount.text = "9.7"
        showRatingCount.leadingAnchor.constraint(equalTo: showRatingImage.leadingAnchor, constant: 35).isActive = true
        showRatingCount.centerYAnchor.constraint(equalTo: showRatingImage.centerYAnchor, constant: 0).isActive = true
        showRatingCount.trailingAnchor.constraint(equalTo: showRelease.trailingAnchor, constant: 0).isActive = true
    }
}
