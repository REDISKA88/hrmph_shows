//
//  SearchCells.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/9/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class ReturndedShowCell: UITableViewCell {
    
    let titleShow: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 24)
        
        return label
    }()
    
    let ratingShow: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    let ratingBack: UIView = {
        let bg = UIView()
        //bg.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.5)
        return bg
    }()
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
           selectionStyle = .none
           backgroundColor = .clear
            
            
            addSubview(titleShow)
            addSubview(ratingBack)
            ratingBack.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.3)
            ratingBack.addSubview(ratingShow)

            titleShow.translatesAutoresizingMaskIntoConstraints = false
            titleShow.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
            titleShow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
            titleShow.trailingAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
            titleShow.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
            
            ratingBack.layer.cornerRadius = 10
            ratingBack.translatesAutoresizingMaskIntoConstraints = false
            ratingBack.topAnchor.constraint(equalTo: topAnchor, constant: frame.height/3).isActive = true
            ratingBack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -frame.height/2).isActive = true
            ratingBack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -frame.height/4).isActive = true
            ratingBack.leadingAnchor.constraint(equalTo: centerXAnchor, constant: frame.width/3).isActive = true
            
    
            
            ratingShow.translatesAutoresizingMaskIntoConstraints = false
            ratingShow.centerXAnchor.constraint(equalTo: ratingBack.centerXAnchor, constant: 0).isActive = true
            ratingShow.centerYAnchor.constraint(equalTo: ratingBack.centerYAnchor, constant: 0).isActive = true
            ratingShow.textColor = .white

            
        }

}
