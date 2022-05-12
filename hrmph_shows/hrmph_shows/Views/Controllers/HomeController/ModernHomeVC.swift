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
    var viewModel = ShowsViewModel()
    var array: [PopularShow]!
    let topIDCell = "topCell"
    let popularLable = UILabel()
    let customCollectionView: iCarousel = {
        let carousel = iCarousel()
        carousel.type = .rotary
        return carousel
    }()
    let topView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 500, height: 100)
        view.backgroundColor = .clear
        return view
       }()
    let mainView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 150, width: 500, height: 600)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getHomeShows()
        setupHomeTopView()
        setupCollectionView()
        setupHomeLabel()
        setupHomeMiddleCollectionView()
    }

    func getHomeShows() {
        
        viewModel.networker.getPopularShows {
            DispatchQueue.main.async {
                self.customCollectionView.reloadData()
                self.midCV.reloadData()
            }
        }
//
//        viewModel.home.getData {
//            DispatchQueue.main.async {
//                self.customCollectionView.reloadData()
//                self.midCV.reloadData()
//            }
//
//        }
    }

}
