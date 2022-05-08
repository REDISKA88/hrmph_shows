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
        self.tabBar.tintColor = .systemTeal
       
        let searchBarController = SearchVC()
        let searchNavigationController = UINavigationController(rootViewController: searchBarController)
        searchNavigationController.navigationBar.tintColor = .clear
        
        let showVC = ShowInfoVC()
        let scroll = ViewController()
        scroll.title = "scroll"
        let profileBarController = ProfileVC()
        let favoritesBarController = FavoritesVC()
        let modernHomeBarController = ModernHomeVC()
        showVC.title = "Show Info"
        modernHomeBarController.title = "Home"
        searchBarController.title = "Search"
        profileBarController.title = "Profile"
        favoritesBarController.title = "Favorites"
        self.setViewControllers([scroll, showVC, modernHomeBarController, searchNavigationController, favoritesBarController, profileBarController], animated: false)
    }
    
    private func setImagesForTabBarItems() {
        let images = [UIImage(systemName: "eye"),UIImage(systemName: "star.fill"),UIImage(systemName: "house"),  UIImage(systemName: "magnifyingglass"), UIImage(systemName: "suit.heart"), UIImage(systemName: "person")]
        guard let tabBarItems = self.tabBar.items else { return }
        for tabBar in tabBarItems.enumerated() {
            tabBar.element.image = images[tabBar.offset]
        }
    }
    
}
