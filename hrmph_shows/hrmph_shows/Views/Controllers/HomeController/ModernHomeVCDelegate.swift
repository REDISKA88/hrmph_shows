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
        return modernVM.numberOfShows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        
        let thisShow = modernVM.showForIndex(index: indexPath.row)
        cell.label.text = thisShow.name
        guard let image = URL(string:(thisShow.image?.original)!) else { return cell }
        getImageFrom(url: image, for: cell.bg)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ModernShowInfoVC()
//        viewModel.networker.idShow = currentShow.id
//               viewModel.networker.presentShowById {
//                   vc.show = self.viewModel.networker.returnedShow
//                   var currentImg: String!
//                   for im in self.viewModel.networker.returnedShowImages {
//                       if im.type == "background" {
//                           if im.resolutions?.original?.url != nil {
//                               currentImg = im.resolutions?.original?.url
//                               break
//                           }
//                       }
//                   }
//                   if currentImg != nil {
//                       vc.bgImage = currentImg
//                   }
//                   DispatchQueue.main.async {
//                     //  vc.updateUserInterface()
//                   }
//               }
        
        let thisShow = modernVM.showForIndex(index: indexPath.row)
        vc.updateUserInterface(with: thisShow)
        self.navigationController?.pushViewController(vc, animated: true)
    
    }

}
// MARK: -iCarousel
extension ModernHomeVC: iCarouselDataSource, iCarouselDelegate {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return modernVM.numberOfShows()
}
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: (self.view.frame.size.width/1.8), height: 300))
        let imageShow: UIImageView = {
            let imageView = UIImageView(frame: view.bounds)
            imageView.contentMode = .scaleToFill
            
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 40
            return imageView
        }()
        view.addSubview(imageShow)
        view.backgroundColor = .clear
    
        let currentShow = modernVM.showForIndex(index: index)
        guard let posterUrl = URL(string: (currentShow.image?.original)!) else {
            return view
        }
        imageShow.image = nil
        URLSession.shared.dataTask(with: posterUrl) { (data, response, error) in
            if let error = error {
                print("load image error: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("empty image data")
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    imageShow.image = image
                }
            }
        }.resume()

        return view
    }

    // didSelectItemAtIndex
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        let vc = ModernShowInfoVC()
        /*
        let currentShow = viewModel.networker.homeTopShowsCollection[index]
               viewModel.networker.idShow = currentShow.id
                      viewModel.networker.presentShowById {
                          vc.show = self.viewModel.networker.returnedShow
                          var currentImg: String!
                          for im in self.viewModel.networker.returnedShowImages {
                              if im.type == "background" {
                                  if im.resolutions?.original?.url != nil {
                                      currentImg = im.resolutions?.original?.url
                                      break
                                  }
                              }
                          }
                          if currentImg != nil {
                              vc.bgImage = currentImg
                          }
                          DispatchQueue.main.async {
                              vc.updateUserInterface()
                          }
                      }
 
         */
        let thisShow = modernVM.showForIndex(index: index)
        vc.updateUserInterface(with: thisShow)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
