//
//  GenresCell.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/10/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class GenresCell: UICollectionViewCell {
    let  genre: UILabel = {
        let name = UILabel()
        name.text = "genre"
        name.textColor = UIColor.white.withAlphaComponent(0.8)
        name.adjustsFontSizeToFitWidth = true
        name.font = .systemFont(ofSize: 20)
        name.textAlignment = .center
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(genre)
            
        genre.translatesAutoresizingMaskIntoConstraints = false
        
        genre.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        genre.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
