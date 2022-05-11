//
//  GenresCell.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/10/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class ShowsCell: UICollectionViewCell {
    var titleForShow = "title"
    var imageForShow = UIImage(named: "19")
    let showImageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        image.backgroundColor = .red
        return image
    }()
    
    let titleLabel: UILabel = {
        let name = UILabel()
        name.textColor = UIColor.white.withAlphaComponent(0.8)
        name.adjustsFontSizeToFitWidth = true
        name.font = .systemFont(ofSize: 15)
        name.numberOfLines = 0
        name.minimumScaleFactor = 0.5
        name.textAlignment = .center
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(titleLabel)
        contentView.addSubview(showImageView)
        showImageView.image = imageForShow
        showImageView.translatesAutoresizingMaskIntoConstraints = false
        showImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        showImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        showImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        showImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
        
        
        titleLabel.text = titleForShow
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: showImageView.bottomAnchor, constant: 3).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
