//
//  HomeVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 4/30/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class HomeVC: MainTheme, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let popularCellID = "popularCollectionViewCell"
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: popularCellID, for: indexPath)
        return cell
    }
    

    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        
    }


}

class PopularCell: UICollectionViewCell {
    
    
}
