//
//  ModernHomeVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/3/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit
import iCarousel


class ModernHomeVC: MainTheme {
   // var array: [PopularShow]!
    let topIDCell = "topCell"
    let popularLable = UILabel()
    let customCollectionView: iCarousel = {
        let carousel = iCarousel()
        carousel.type = .rotary
        return carousel
    }()
    let topHomeView: UIView = {
        let view = UIView()
       // view.frame = CGRect(x: 0, y: 0, width: 500, height: 100)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
       }()
    let mainHomeView: UIView = {
        let view = UIView()
      //  view.frame = CGRect(x: 0, y: 150, width: 500, height: 600)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let midCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()

    let homeScrollView: UIScrollView = {
         let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
         scrollView.translatesAutoresizingMaskIntoConstraints = false
         return scrollView
     }()

     let homeScrollViewContainer: UIStackView = {
         let view = UIStackView()

         view.axis = .vertical
         view.spacing = 0

         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
    
        let topBGView: UIView = {
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
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.backgroundColor = .clear
        return view
    }()

    let middleBGView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        view.backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
        return view
    }()

    let bottomBGView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 340).isActive = true
        view.backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
        
        //view.backgroundColor = .green
        return view
    }()
    
    
    var modernVM = ModernViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeScrollView)
        homeScrollView.addSubview(homeScrollViewContainer)
        homeScrollViewContainer.addArrangedSubview(topBGView)
        homeScrollViewContainer.addArrangedSubview(middleBGView)
        homeScrollViewContainer.addArrangedSubview(bottomBGView)
        
       loadPopularShows()
     //  getHomeShows()
        
        setupHomeScrollView()
        setupHomeScrollViewContainer()
        setupHomeTopView()
        setupHomeMiddleView()
        setupLabelHomeBottomView()
        setupCollectionViewHomeBottomView()
//        setupHomeTopView()
//        setupCollectionView()
//        setupHomeLabel()
//        setupHomeMiddleCollectionView()
    }
    
    func loadPopularShows() {
        modernVM.fetchPopularShows{ [weak self] in
            self?.customCollectionView.reloadData()
        }
        modernVM.fetchPopularTonight{ [weak self] in
            self?.customCollectionView.reloadData()
            self?.midCV.reloadData()
        }
    }


}
