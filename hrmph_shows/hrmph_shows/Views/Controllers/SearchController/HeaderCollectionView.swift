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
    let mostPopularText = "Sort by: Most popular"
    let mostFollowedText = "Sort by: Most Followed"
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "text label"
       // label.font = .systemFont(ofSize: 40)
        label.textAlignment = .center
        
        return label
    }()
    
    let sortButton: UIButton = {
        let sort = UIButton()
        sort.tintColor = UIColor.white.withAlphaComponent(0.8)
        sort.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .light, scale: .large)
        sort.setImage(UIImage(systemName: "arrow.up.arrow.down.square.fill", withConfiguration: config), for: .normal)
        
        return sort
    }()
    
    let sortLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Sort by:   Most popular"
        label.textColor = UIColor.white.withAlphaComponent(0.7)
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let filterButton: UIButton = {
        let filter = UIButton()
        filter.tintColor = UIColor.white.withAlphaComponent(0.8)
        filter.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .light, scale: .large)
        filter.setImage(UIImage(systemName: "equal.square.fill", withConfiguration: config), for: .normal)
        
        return filter
    }()
    public func configure() {
        backgroundColor = .systemGreen
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    
    func setupSort() {
        backgroundColor = .clear
        addSubview(sortButton)
        sortButton.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        sortButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        addSubview(filterButton)
        filterButton.centerYAnchor.constraint(equalTo: sortButton.centerYAnchor).isActive = true
        filterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
       
        addSubview(sortLabel)
        sortLabel.text = mostFollowedText
        sortLabel.centerYAnchor.constraint(equalTo: sortButton.centerYAnchor).isActive = true
        sortLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
