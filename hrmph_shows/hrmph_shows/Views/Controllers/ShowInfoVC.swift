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
    let showRelease :UILabel = {
        let year = UILabel()
        year.textColor = .black
        year.font = .systemFont(ofSize: 25)
        year.textAlignment = .center
        return year
    }()
    let showRating = UILabel()
    let showRatingImage = UIImage()
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
        view.backgroundColor = .systemPink
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTopBackgroundView()
        setupMainView()
        setupShowImageView()
        setupShowInfoView()
    }
    
    func setupMainView() {
        view.addSubview(mainView)
        mainView.layer.cornerRadius = 40
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: -50).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func setupShowInfoView() {
        
        view.addSubview(showInfoView)
        showInfoView.layer.cornerRadius = 30
        showInfoView.translatesAutoresizingMaskIntoConstraints = false
        showInfoView.leadingAnchor.constraint(equalTo: showImage.leadingAnchor, constant: -35).isActive = true
        showInfoView.trailingAnchor.constraint(equalTo: showImage.trailingAnchor, constant: 35).isActive = true
        showInfoView.topAnchor.constraint(equalTo: showImage.bottomAnchor, constant: 15).isActive = true
        showInfoView.bottomAnchor.constraint(equalTo: showImage.bottomAnchor, constant: 120).isActive = true
        showInfoView.addSubview(showTitle)
        showTitle.translatesAutoresizingMaskIntoConstraints = false
        showTitle.centerYAnchor.constraint(equalTo: showInfoView.topAnchor, constant: 25).isActive = true
        showTitle.centerXAnchor.constraint(equalTo: showInfoView.centerXAnchor, constant: 0).isActive = true
        showTitle.text = "Batman"
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
