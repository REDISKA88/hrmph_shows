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
        let homeBarController = HomeVC()
        let searchBarController = SearchVC()
        let profileBarController = ProfileVC()
        let favoritesBarController = FavoritesVC()
        let modernHomeBarController = ModernHomeVC()
        modernHomeBarController.title = "Modern"
        homeBarController.title = "Home"
        searchBarController.title = "Search"
        profileBarController.title = "Profile"
        favoritesBarController.title = "Favorites"
        self.setViewControllers([modernHomeBarController, homeBarController, searchBarController, favoritesBarController, profileBarController], animated: false)
    }
    
    private func setImagesForTabBarItems() {
        let images = [UIImage(systemName: "house.fill"), UIImage(systemName: "house"), UIImage(systemName: "suit.heart"), UIImage(systemName: "magnifyingglass"), UIImage(systemName: "person")]
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
