//
//  HeaderCollectionView.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/10/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class HeaderCollectionView: UICollectionReusableView {
        static let identifier = "HeaderCollectionView"
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "text label"
       // label.font = .systemFont(ofSize: 40)
        label.textAlignment = .center
        
        return label
    }()
    public func configure() {
        backgroundColor = .systemGreen
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
