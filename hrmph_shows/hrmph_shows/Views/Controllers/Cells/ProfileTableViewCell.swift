//
//  ProfileTableViewCell.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/5/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundColor = .clear
        selectionStyle = .none
    }

}
