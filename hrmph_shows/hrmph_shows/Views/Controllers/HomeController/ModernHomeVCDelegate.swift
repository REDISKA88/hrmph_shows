//
//  ModernHomeVCDelegate.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/12/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit
import iCarousel

// MARK: -middleCollectionView
extension ModernHomeVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       // return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.home.returnedShowsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        
        let currentShow = viewModel.home.returnedShowsArray[indexPath.row]
                guard let url = URL(string: currentShow.image?.original ?? "") else { return cell }
        do {
            let data = try Data(contentsOf: url)
            cell.bg.image = UIImage(data: data)
        } catch { print("error fail load image from url") }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ModernShowInfoVC()
        vc.show = viewModel.home.returnedShowsArray[indexPath.row]
        present(vc, animated: true)
    }

}
// MARK: -iCarousel
extension ModernHomeVC: iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return viewModel.home.returnedShowsArray.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: (self.view.frame.size.width/2), height: 300))
        let imageShow: UIImageView = {
            let imageView = UIImageView(frame: view.bounds)
            imageView.contentMode = .scaleToFill
            
//            imageView.layer.masksToBounds = true
//            imageView.layer.cornerRadius = 50
            return imageView
        }()
        view.addSubview(imageShow)
        view.backgroundColor = .clear
        
        let current = viewModel.home.returnedShowsArray.shuffled()
        guard let url = URL(string: current[index].image?.original ?? "") else { return view }
           do {
               let data = try Data(contentsOf: url)
               imageShow.image = UIImage(data: data)
            imageShow.layer.cornerRadius = 25
            imageShow.layer.masksToBounds = true
           } catch { print("error fail load image from url") }
        return view
//        imageShow.image = UIImage(named: popularImages[index])
//        imageShow.layer.cornerRadius = 25
//        imageShow.layer.masksToBounds = true
//        return view
    }
    
    
}
