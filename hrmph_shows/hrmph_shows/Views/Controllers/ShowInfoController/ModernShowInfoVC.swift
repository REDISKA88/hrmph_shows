//
//  ModernShowInfoVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/8/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class ModernShowInfoVC: ShowBackgroundTheme {
    var show: Show!
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
    let genresShow: UILabel = {
        let genres = UILabel()
        genres.font = .systemFont(ofSize: 24)
        genres.backgroundColor = UIColor.darkGray.withAlphaComponent(0.1)
        genres.layer.masksToBounds = true
        genres.layer.cornerRadius = 20
        genres.translatesAutoresizingMaskIntoConstraints = false
        genres.textColor = UIColor.white.withAlphaComponent(0.9)
        genres.textAlignment = .center
        return genres
    }()

    
    func updateUserInterface() {
        showTitle.text = show.name
        show.summary = show.summary?.replacingOccurrences(of: "<[^>]+>", with: "",
            options: .regularExpression, range: nil)
        summaryShow.text = show.summary
        if let rating = show.rating?.average {
            showRatingCount.text = "\(rating)"
        } else { showRatingCount.text = "-" }
        
        if show.genres != nil {
            var list = ""
            for genre in show.genres! {
                list += " \(genre), "
            }
            list.removeLast()
            list.removeLast()
            genresShow.text = list
        }
        guard let url = URL(string: show.image?.original ?? "") else { return }
        do {
            let data = try Data(contentsOf: url)
            showImage.image = UIImage(data: data)
        } catch { print("error fail load image from url") }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        guard show != nil else {
            print("!!!Show is nil in ModernShowInfoVc")
            return
        }
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
        setupGenresShow()
        setupSummaryTextView()
        updateUserInterface()
    
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



