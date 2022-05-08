//
//  ModernShowInfoVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/8/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class ModernShowInfoVC: ShowBackgroundTheme {
    
    let actorsArray = ["cast1", "cast2","cast3","cast4","cast5","cast6","cast7"]
    let showImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        //imageView.layer.masksToBounds = true
        //imageView.layer.cornerRadius = 50
        return imageView
    }()
    
    
    let showInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
       // view.backgroundColor = UIColor.darkGray.withAlphaComponent(1)
        return view
    }()
    
    let actionView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let showTitle: UILabel = {
           let title = UILabel()
           title.textColor = .white
           title.font = .boldSystemFont(ofSize: 25)
           title.textAlignment = .center
           return title
       }()
       let showRelease: UILabel = {
           let year = UILabel()
           year.textColor = .white
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
    
    
    let favoriteButton: UIButton = {
        let favorite = UIButton(type: UIButton.ButtonType.custom)
        favorite.tintColor = .white
        favorite.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .light, scale: .large)
        favorite.setImage(UIImage(systemName: "suit.heart", withConfiguration: config), for: .normal)
        //favorite.setImage(UIImage(systemName: "suit.heart.fill", withConfiguration: config), for: .selected)
        return favorite
    }()
    
    let watchingButton: UIButton = {
        let watching = UIButton()
          watching.tintColor = .white
          watching.translatesAutoresizingMaskIntoConstraints = false
          let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .light, scale: .large)
          watching.setImage(UIImage(systemName: "eye", withConfiguration: config), for: .normal)
        return watching
    }()
    
    let ratingButton: UIButton = {
        let rating = UIButton()
        rating.tintColor = .white
        rating.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .light, scale: .large)
        rating.setImage(UIImage(systemName: "star", withConfiguration: config), for: .normal)
        return rating
    }()
    
    let reviewButton: UIButton = {
        let review = UIButton()
        review.tintColor = .white
        review.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .light, scale: .large)
        review.setImage(UIImage(systemName: "pencil.circle", withConfiguration: config), for: .normal)
        return review
    }()
    
    let castShow: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = -20
        let cast = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cast.translatesAutoresizingMaskIntoConstraints = false
        cast.showsHorizontalScrollIndicator = false
        cast.register(CastCell.self, forCellWithReuseIdentifier: "CastCell")
        return cast
    }()
    let summaryShow: UITextView = {
        let text = UITextView()
        text.isEditable = false
        text.textAlignment = .left
        text.backgroundColor = .clear
        text.font = UIFont.systemFont(ofSize: 20)
        text.textColor = UIColor.white.withAlphaComponent(0.8)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(topVeiw)
        scrollViewContainer.addArrangedSubview(middleView)
        scrollViewContainer.addArrangedSubview(bottomView)
        
        setupScrollView()
        setupScrollViewContainer()
        setupTopView()
        setupMiddleView()
        setupActionView()
        setupCastCollectionView()
        setupSummaryTextView()

    
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
        summaryShow.text = "Based on the bestselling book series A Song of Ice and Fire by George R.R. Martin, this sprawling new HBO drama is set in a world where summers span decades and winters can last a lifetime. From the scheming south and the savage eastern lands, to the frozen north and ancient Wall that protects the realm from the mysterious darkness beyond, the powerful families of the Seven Kingdoms are locked in a battle for the Iron Throne. This is a story of duplicity and treachery, nobility and honor, conquest and triumph. In the Game of Thrones, you either win or you die."
        summaryShow.topAnchor.constraint(equalTo: castShow.bottomAnchor, constant: 20).isActive = true
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
        favoriteButton.leadingAnchor.constraint(equalTo: actionView.leadingAnchor, constant: 50).isActive = true
        favoriteButton.centerYAnchor.constraint(equalTo: actionView.centerYAnchor, constant: 0).isActive = true
        
        watchingButton.leadingAnchor.constraint(equalTo: actionView.centerXAnchor, constant: -55).isActive = true
        watchingButton.centerYAnchor.constraint(equalTo: actionView.centerYAnchor, constant: 0).isActive = true
        
        ratingButton.trailingAnchor.constraint(equalTo: actionView.centerXAnchor, constant: 55).isActive = true
        ratingButton.centerYAnchor.constraint(equalTo: actionView.centerYAnchor, constant: 0).isActive = true
        
        reviewButton.trailingAnchor.constraint(equalTo: actionView.trailingAnchor, constant: -50).isActive = true
        reviewButton.centerYAnchor.constraint(equalTo: actionView.centerYAnchor, constant: 0).isActive = true
    }
    
    func setupScrollView() {
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
        showImage.image = UIImage(named: "pp1")
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
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let scrollViewContainer: UIStackView = {
        let view = UIStackView()

        view.axis = .vertical
        view.spacing = 0

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let topVeiw: UIView = {
        let view = UIView()
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subview)
        subview.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        subview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        subview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        subview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100).isActive = true
        // MARK: -top corner backgroundView
        subview.backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
        subview.layer.cornerRadius = 50
        view.heightAnchor.constraint(equalToConstant: 400).isActive = true
        view.backgroundColor = .clear
        return view
    }()

    let middleView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 220).isActive = true
        view.backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
        return view
    }()

    let bottomView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 700).isActive = true
        view.backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
        
        //view.backgroundColor = .green
        return view
    }()
}



