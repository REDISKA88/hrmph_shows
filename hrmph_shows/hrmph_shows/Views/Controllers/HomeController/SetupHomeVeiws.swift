//
//  SetupHomeVeiws.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/12/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit
/*
extension ModernHomeVC {
    
    func setupHomeTopView() {
        view.addSubview(topView)
        let logo = UIImageView()
        logo.contentMode = .scaleAspectFit
        logo.clipsToBounds = true
        logo.image = UIImage(named: "logo")
        topView.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.topAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        logo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
    }
    
    func setupCollectionView() {
        view.addSubview(mainView)
        mainView.addSubview(midCV)
        mainView.addSubview(customCollectionView)
        customCollectionView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300)
        customCollectionView.dataSource = self
        
    }
    
    func setupHomeLabel() {
        
        mainView.addSubview(popularLable)
        popularLable.text = "Popular shows tonight"
        //popularLable.textColor = .systemTeal
        //popularLable.textColor = UIColor.systemTeal.withAlphaComponent(0.6)
        //popularLable.textColor = #colorLiteral(red: 1, green: 0, blue: 0.9970282912, alpha: 1).withAlphaComponent(0.5)
        // popularLable.textColor = #colorLiteral(red: 1, green: 0.6628466249, blue: 0.9197291732, alpha: 1).withAlphaComponent(0.7)
        popularLable.textColor = UIColor.white.withAlphaComponent(0.8)
        popularLable.layer.cornerRadius = 10
        popularLable.layer.masksToBounds = true
        popularLable.font = .boldSystemFont(ofSize: 30)
        popularLable.translatesAutoresizingMaskIntoConstraints = false
        popularLable.topAnchor.constraint(equalTo: customCollectionView.bottomAnchor, constant: 10).isActive = true
        popularLable.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10).isActive = true
        popularLable.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    func setupHomeMiddleCollectionView() {
        
        midCV.backgroundColor = .clear
        midCV.delegate = self
        midCV.dataSource = self
        
        //midCV.topAnchor.constraint(equalTo: customCollectionView.bottomAnchor, constant: 0).isActive = true
        midCV.topAnchor.constraint(equalTo: popularLable.bottomAnchor, constant: 10).isActive = true
        midCV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        midCV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        midCV.heightAnchor.constraint(equalToConstant: view.frame.width/1.5).isActive = true
        // midCV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

 */

extension ModernHomeVC {
  
    func setupHomeScrollView() {
        homeScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        homeScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        homeScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        homeScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupHomeScrollViewContainer() {
        homeScrollViewContainer.leadingAnchor.constraint(equalTo: homeScrollView.leadingAnchor).isActive = true
        homeScrollViewContainer.trailingAnchor.constraint(equalTo: homeScrollView.trailingAnchor).isActive = true
        homeScrollViewContainer.topAnchor.constraint(equalTo: homeScrollView.topAnchor, constant: 30).isActive = true
        homeScrollViewContainer.bottomAnchor.constraint(equalTo: homeScrollView.bottomAnchor).isActive = true
        
        homeScrollViewContainer.widthAnchor.constraint(equalTo: homeScrollView.widthAnchor).isActive = true
    }
    
    func setupHomeTopView() {
        let logo = UIImageView()
        logo.contentMode = .scaleAspectFit
        logo.clipsToBounds = true
        logo.image = UIImage(named: "logo")
        topBGView.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.topAnchor.constraint(equalTo: topBGView.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        logo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
    }
    
    func setupHomeMiddleView() {
         middleBGView.addSubview(customCollectionView)
        customCollectionView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300)
        customCollectionView.dataSource = self
    }
    
    func setupLabelHomeBottomView() {
        bottomBGView.addSubview(popularLable)
        popularLable.text = "Popular shows tonight"
        popularLable.textColor = UIColor.white.withAlphaComponent(0.8)
        popularLable.layer.cornerRadius = 10
        popularLable.layer.masksToBounds = true
        popularLable.font = .boldSystemFont(ofSize: 30)
        popularLable.translatesAutoresizingMaskIntoConstraints = false
        popularLable.topAnchor.constraint(equalTo: customCollectionView.bottomAnchor, constant: 10).isActive = true
        popularLable.leadingAnchor.constraint(equalTo: middleBGView.leadingAnchor, constant: 10).isActive = true
        popularLable.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
    }
    
    func setupCollectionViewHomeBottomView() {
        bottomBGView.addSubview(midCV)
        midCV.backgroundColor = .clear
        midCV.delegate = self
        midCV.dataSource = self
    
        midCV.topAnchor.constraint(equalTo: popularLable.bottomAnchor, constant: 10).isActive = true
        midCV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        midCV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        midCV.heightAnchor.constraint(equalToConstant: view.frame.width/1.5).isActive = true
    }
    
    
    
}
