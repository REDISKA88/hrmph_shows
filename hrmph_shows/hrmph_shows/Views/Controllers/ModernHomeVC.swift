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
    
    let topIDCell = "topCell"
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
    
    
    var popularImages = ["0", "1", "2","3","4","5","6","7"]
    var allImages = ["8", "9", "10","11","12","13","14","15", "16", "17","18","19","20","21","22","23","24","25","26","27","28"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularImages.shuffle()
        allImages.shuffle()
        view.addSubview(topView)
        let logo = UIImageView()
        logo.contentMode = .scaleAspectFit
        logo.clipsToBounds = true
        logo.image = UIImage(named: "logo")
        topView.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.topAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        logo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        view.addSubview(mainView)
        setupCollectionView()
        
        
        
        mainView.addSubview(midCV)
        
        let popularLable = UILabel()
        mainView.addSubview(popularLable)
        popularLable.text = "Popular shows tonight"
        //popularLable.textColor = .systemTeal
        popularLable.textColor = UIColor.systemTeal.withAlphaComponent(0.6)
        popularLable.layer.cornerRadius = 10
        popularLable.layer.masksToBounds = true
        popularLable.font = .boldSystemFont(ofSize: 30)
        popularLable.translatesAutoresizingMaskIntoConstraints = false
        popularLable.topAnchor.constraint(equalTo: customCollectionView.bottomAnchor, constant: 10).isActive = true
        popularLable.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10).isActive = true
        popularLable.heightAnchor.constraint(equalToConstant: 35).isActive = true
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

    func setupCollectionView() {
        mainView.addSubview(customCollectionView)
        customCollectionView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300)
        customCollectionView.dataSource = self
        
    }
}
// MARK: -middleCollectionView
extension ModernHomeVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       // return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        let imageName = allImages[indexPath.item]
        cell.bg.image = UIImage(named: imageName)
        return cell
    }
    

}
// MARK: -iCarousel
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

class CustomCell: UICollectionViewCell {
        
     let bg: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 15
        return iv
    }()
    
    let label: UILabel = {
       let name = UILabel()
        name.text = "name"
        name.textColor = .white
        name.adjustsFontSizeToFitWidth = true
        name.font = .systemFont(ofSize: 20)
        name.textAlignment = .center
        return name
    }()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(bg)
        contentView.addSubview(label)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
       // bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
       bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 5).isActive = true
//        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



