//
//  PopularCollectionViewCell.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/2/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class PopularCell: UICollectionViewCell {
    var images: [String]? {
        didSet {
            popularCollectionView.reloadData()
        }
    }
    var img = "popular3"
    let showCellID = "ShowCell"
    let popularCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    
    func setupCollectionView() {
       // backgroundColor = .red
        addSubview(popularCollectionView)
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.showsHorizontalScrollIndicator = false
        popularCollectionView.translatesAutoresizingMaskIntoConstraints = false
        popularCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        popularCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        popularCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        popularCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        popularCollectionView.register(ShowCell.self, forCellWithReuseIdentifier: showCellID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PopularCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: showCellID, for: indexPath) as! ShowCell
        if let imageName = images?[indexPath.item] {
            cell.showImage.image = UIImage(named: imageName)
        }

       return cell
    }
    
    
}
extension PopularCell {
    private class ShowCell: UICollectionViewCell {
                
        var showImage: UIImageView = {
            let image = UIImageView()
            image.contentMode = .scaleAspectFit
            image.clipsToBounds = true
            image.layer.cornerRadius = 15
            return image
        }()
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupShowCell()
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setupShowCell() {
            addSubview(showImage)
            showImage.translatesAutoresizingMaskIntoConstraints = false
            showImage.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
            showImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
            showImage.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
            showImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        }
    }
}
