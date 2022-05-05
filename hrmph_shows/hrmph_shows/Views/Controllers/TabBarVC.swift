//
//  TabBarVC.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 5/2/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setImagesForTabBarItems()
        
    }
    

    private func setupTabBar() {
        self.tabBar.barTintColor = .black
        self.tabBar.tintColor = .systemTeal
        let searchBarController = SearchVC()
        let profileBarController = ProfileVC()
        let favoritesBarController = FavoritesVC()
        let modernHomeBarController = ModernHomeVC()
        let video = ViewController()
        modernHomeBarController.title = "Home"
        searchBarController.title = "Search"
        profileBarController.title = "Profile"
        favoritesBarController.title = "Favorites"
        video.title = "Video"
        self.setViewControllers([modernHomeBarController,  searchBarController, favoritesBarController, profileBarController, video], animated: false)
    }
    
    private func setImagesForTabBarItems() {
        let images = [UIImage(systemName: "house"),  UIImage(systemName: "magnifyingglass"), UIImage(systemName: "suit.heart"), UIImage(systemName: "person"), UIImage(systemName: "person")]
        guard let tabBarItems = self.tabBar.items else { return }
        for tabBar in tabBarItems.enumerated() {
            tabBar.element.image = images[tabBar.offset]
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
