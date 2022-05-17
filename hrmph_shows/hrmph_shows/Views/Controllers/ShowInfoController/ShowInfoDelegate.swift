//
//  ShowInfoDelegate.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/8/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit
extension ModernShowInfoVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return showInfoVM.numberOfActors()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CastCell", for: indexPath) as! CastCell
        
        let thisActor = showInfoVM.getActorByIndex(index: indexPath.row)
        if let name = thisActor.person?.name { cell.actorName.text = name }
        var image = thisActor.character?.image?.medium
        if image == nil { image = thisActor.person?.image?.medium }
        guard image != nil else { return cell }
        guard let imageUrl = URL(string: image!) else { return cell }
        getImageFrom(url: imageUrl, for: cell.actorImage)
        return cell
    }
    
    
}
