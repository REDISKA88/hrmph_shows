//
//  GenresCell.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/10/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class ShowsCell: UICollectionViewCell {
    let title: UILabel = {
        let name = UILabel()
        name.text = "title"
        name.textColor = UIColor.white.withAlphaComponent(0.8)
        name.adjustsFontSizeToFitWidth = true
        name.font = .systemFont(ofSize: 20)
        name.textAlignment = .center
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(title)
            
        title.translatesAutoresizingMaskIntoConstraints = false
        
        title.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
