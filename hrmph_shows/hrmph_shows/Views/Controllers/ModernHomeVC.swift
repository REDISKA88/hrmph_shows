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

    let customCollectionView: iCarousel = {
        let carousel = iCarousel()
        carousel.type = .rotary
        return carousel
    }()
    
    var popularImages = ["0", "1", "2","3","4","5","6","7"]
    var allImages = ["0", "1", "2","3","4","5","6","7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
//        for i in 0..<8 {
//            popularImages.append("\(i)")
//        }
//
//        for i in 8..<28 {
//            allImages.append("\(i)")
//        }
    }
    
    func setupCollectionView() {
        
        customCollectionView.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 300)
        
        view.addSubview(customCollectionView)
        //customCollectionView.translatesAutoresizingMaskIntoConstraints = false
        customCollectionView.dataSource = self
        
    }
}

extension ModernHomeVC: iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return popularImages.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: (self.view.frame.size.width/2), height: 300))
        let imageShow: UIImageView = {
            let imageView = UIImageView(frame: view.bounds)
            imageView.contentMode = .scaleToFill
//            imageView.layer.masksToBounds = true
//            imageView.layer.cornerRadius = 50
            return imageView
        }()
        view.addSubview(imageShow)
        view.backgroundColor = .clear
        
        imageShow.image = UIImage(named: popularImages[index])
       imageShow.layer.cornerRadius = 25
        imageShow.layer.masksToBounds = true
        return view
    }
    
    
}
