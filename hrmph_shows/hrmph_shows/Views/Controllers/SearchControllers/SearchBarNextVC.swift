//
//  SearchBarNextVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/9/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class SearchBarNextVC: MainTheme {
    
    var request: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard request != nil else { return }
        print(request!)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height/4, width: self.view.bounds.width, height: UIScreen.main.bounds.height)
        self.view.layer.cornerRadius = 30
        self.view.layer.masksToBounds = true
        
    }
    
}

