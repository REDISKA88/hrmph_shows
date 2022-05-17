//
//  CustomCVCell.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/12/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
        
     let bg: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 25
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
