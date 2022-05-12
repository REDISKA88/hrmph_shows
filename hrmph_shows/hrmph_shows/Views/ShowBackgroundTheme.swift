//
//  ShowBackgroundTheme.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/8/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class ShowBackgroundTheme: UIViewController {
    let topViewImage = UIImageView()
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundTheme()
        //view.backgroundColor = .black
        view.backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
    }
    
   func setupBackgroundTheme() {
        view.addSubview(topView)
        topView.addSubview(topViewImage)
    topView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/2.8)
        topViewImage.frame = topView.frame
       // topViewImage.image = UIImage(named: "bg0")
        topViewImage.contentMode = .scaleAspectFill
        
        let lightBlure = UIBlurEffect(style: .regular)
        let effectView = UIVisualEffectView (effect: lightBlure)
        effectView.alpha = 0.5
        effectView.frame = topViewImage.bounds
        topViewImage.addSubview(effectView)
    }
   

}
