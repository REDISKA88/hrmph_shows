//
//  CastCell.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/8/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class CastCell: UICollectionViewCell {
    
    let actorImage: UIImageView = {
        let actor = UIImageView()
        actor.translatesAutoresizingMaskIntoConstraints = false
       actor.contentMode = .scaleAspectFill
        actor.clipsToBounds = true
        actor.image = nil
        actor.layer.cornerRadius = 46
        return actor
    }()
    
    let actorName: UILabel = {
       let name = UILabel()
        name.text = ""
        name.textColor = UIColor.white.withAlphaComponent(0.8)
        name.adjustsFontSizeToFitWidth = true
        name.font = .systemFont(ofSize: 20)
        name.textAlignment = .center
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(actorImage)
        contentView.addSubview(actorName)
        actorImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        actorImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -45).isActive = true
        actorImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        actorImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        
        
        actorName.translatesAutoresizingMaskIntoConstraints = false
    
        actorName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        actorName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
