//
//  TabBarVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/2/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {
    
    var showsVM = ShowsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setImagesForTabBarItems()
        showsVM.shows.getData {
            
        }
    }
    

    private func setupTabBar() {
        self.tabBar.barTintColor = .black
        self.tabBar.tintColor = .white
       
        
        
        let homeBarController = ModernHomeVC()
        let homeNavigationController = UINavigationController(rootViewController: homeBarController)
          homeNavigationController.navigationBar.tintColor = .clear
        
        
        let searchBarController = SearchPageVC()
        let searchNavigationController = UINavigationController(rootViewController: searchBarController)
        searchNavigationController.navigationBar.tintColor = .clear
        
        let favoritesBarController = FavoritesVC()
        let favoritesNavigationController = UINavigationController(rootViewController: favoritesBarController)
        favoritesNavigationController.navigationBar.tintColor = .clear
        
      //  let modernProfileController = ModernProfileVC()
        let profileBarController = ProfileVC()
        let profileNavigationController = UINavigationController(rootViewController: profileBarController)
        profileNavigationController.navigationBar.tintColor = .clear
       
        
        

        homeBarController.title = "Home"
        searchBarController.title = "Search"
        favoritesBarController.title = "Favorites"
        profileBarController.title = "Profile"
        
        self.setViewControllers([homeNavigationController, searchNavigationController, favoritesNavigationController, profileNavigationController], animated: false)
    }
    
    private func setImagesForTabBarItems() {
        let images = [UIImage(systemName: "house"),  UIImage(systemName: "magnifyingglass"), UIImage(systemName: "suit.heart"), UIImage(systemName: "person")]
        guard let tabBarItems = self.tabBar.items else { return }
        for tabBar in tabBarItems.enumerated() {
            tabBar.element.image = images[tabBar.offset]
        }
    }
    
}
