//
//  HomeVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 4/30/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class HomeVC: MainTheme {
    
    let topIDCell = "topCell"
    let midIDCell = "allCell"

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.scrollDirection = .vertical
        let collectionV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionV.backgroundColor = .clear
        return collectionV
    }()
    
    var popularImages = ["popular1", "popular2", "popular3","popular4","popular5","popular6","popular7",]
    var allImages = ["a0", "a1","a2","a3","a4","a5", "a6", "a7", "a8"]
 
   
    // @IBOutlet weak var popularCollectionView: UICollectionView!
  //  @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...24 {
            allImages.append("b\(i)")
          }
     //
        
       // view.addSubview(hrmph)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PopularCell.self, forCellWithReuseIdentifier: topIDCell)
        collectionView.register(MiddleCell.self, forCellWithReuseIdentifier: midIDCell)
        collectionView.register(LogoCell.self, forCellWithReuseIdentifier: "logoCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
      //  collectionView.topAnchor.constraint(equalTo: hrmph.topAnchor, constant: 90).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 2 { return allImages.count } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            let topCell = collectionView.dequeueReusableCell(withReuseIdentifier: topIDCell, for: indexPath) as! PopularCell
            topCell.images = popularImages
            return topCell
        }
        if indexPath.section == 2 {
            let midCell = collectionView.dequeueReusableCell(withReuseIdentifier: midIDCell, for: indexPath) as! MiddleCell
                 midCell.midImage = allImages[indexPath.item]
                 return midCell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "logoCell", for: indexPath) as! LogoCell
        return cell
    }

    func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath:IndexPath)
        -> CGSize {
            if indexPath.section == 2 {
                return CGSize(width: (view.frame.width/3) - 25, height: 150)
            }
            if indexPath.section == 1 {
                return CGSize(width: (view.frame.width), height: 300)
            }
        //return CGSize(width: (view.frame.width/3) - 25, height: 150)
            return CGSize(width: (view.safeAreaLayoutGuide.layoutFrame.width), height: 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 2 {
            return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        }
        if section == 1 {
            return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        }
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)

    }
    

}

class LogoCell: UICollectionViewCell {
    var hrmph: UIImageView = {
         let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(hrmph)
        hrmph.image = UIImage(named: "logo")
        hrmph.translatesAutoresizingMaskIntoConstraints = false
//        hrmph.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
//        hrmph.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        hrmph.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
       // hrmph.leadingAnchor.constraint(equalTo: leadingAnchor, constant: safeAreaLayoutGuide.layoutFrame.width/2).isActive = true
        hrmph.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


