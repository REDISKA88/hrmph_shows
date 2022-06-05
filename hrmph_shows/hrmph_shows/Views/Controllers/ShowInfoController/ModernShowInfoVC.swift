//
//  ModernShowInfoVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/8/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit
protocol RatingDelegate {
    func updateRating( id: Int, rating: Int)
}
class ModernShowInfoVC: ShowBackgroundTheme, RatingDelegate {
    var show: Show!
    var cast = [Actor]()
    var bgImage: String!
    var showInfoVM: ModernViewModel!
    let showImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        //imageView.layer.masksToBounds = true
        //imageView.layer.cornerRadius = 50
        return imageView
    }()
    
    func updateRating( id: Int, rating: Int) {
         showInfoVM.rateTheShow(showId: id, rate: rating)
        if showInfoVM.showWasRated(show: show) != nil {
            activateButton(button: ratingButton, enable: true)
        } else {
            activateButton(button: ratingButton, enable: false)
        }
       
      }
    
    let backButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(popBack), for: .touchUpInside)
        button.tintColor = UIColor.white.withAlphaComponent(0.9)
          button.translatesAutoresizingMaskIntoConstraints = false
              let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .light, scale: .large)
              button.setImage(UIImage(systemName: "chevron.left", withConfiguration: config), for: .normal)
        // lessthan.square.fill
        return button
    }()
    
    @objc func popBack() {
       self.navigationController?.popViewController(animated: false)
    }
    let showInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
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
    
    func searchCast(by id: Int) {
        showInfoVM.fetchShowActorsBy(intId: id) {
            self.castShow.reloadData()
        }
    }
    
    func updateUserInterface(with tvShow: Show) {
      
        // for actionView& his buttons targets
        show = tvShow
        //
        
        searchCast(by: tvShow.id!)
        showInfoVM.fetchBackgroundShowImage(intId: tvShow.id, back: backViewImage)
        showTitle.text = tvShow.name
        let about = tvShow.summary?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        summaryShow.text = about
        if let rating = tvShow.rating?.average {
            showRatingCount.text = "\(rating)"
        } else { showRatingCount.text = "-" }
        
        guard let posterUrl = URL(string: (tvShow.image?.original)!) else { return }
        showImage.image = nil
        getImageFrom(url: posterUrl, for: showImage)
        guard let genres = tvShow.genres else { return }
        
        if let premier = tvShow.premiered {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.date(from:premier)
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year], from: date!)
            if let year = components.year {
                showRelease.text = "\(year)"
            }
        }
        
        
        if genres.count > 0 {
            var list = ""
            for genre in tvShow.genres! {
                list += " \(genre), "
            }
                        list.removeLast()
                        list.removeLast()
            genresShow.text = list
        }
    }
    
    
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
        setupActionButtons()
        setupCastCollectionView()
        setupGenresShow()
        setupSummaryTextView()

    }



    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
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

extension UIView {
    func getImageFrom(url: URL, for poster: UIImageView) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("load image error: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("empty image data")
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    poster.image = image
                }
            }
        }.resume()
    }
}



