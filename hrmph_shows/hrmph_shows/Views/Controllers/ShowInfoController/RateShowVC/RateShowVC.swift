//
//  RateShowVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 6/4/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class RateShowVC: MainTheme {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height/1.45, width: self.view.bounds.width, height: UIScreen.main.bounds.height)
        self.view.layer.cornerRadius = 30
        self.view.layer.masksToBounds = true

    }

}
