//
//  ProfileTableViewCell.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/5/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    var nameForCurrentCell: String = "name"
    let fon = UIImageView()
    let sectionName: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        //button.sizeThatFits(CGSize(width: 100, height: 100))
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
       // addSubview(sectionName)
        addSubview(fon)
//        fon.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        fon.contentMode = .scaleAspectFit
        fon.translatesAutoresizingMaskIntoConstraints = false
        fon.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        fon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        fon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150).isActive = true
        fon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        
        
      //  sectionName.setTitle(nameForCurrentCell, for: .normal)
        
     //   sectionName.translatesAutoresizingMaskIntoConstraints = false
      //  sectionName.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
    //    sectionName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
     //   sectionName.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        selectionStyle = .none
        backgroundColor = .clear
        
    }

}
