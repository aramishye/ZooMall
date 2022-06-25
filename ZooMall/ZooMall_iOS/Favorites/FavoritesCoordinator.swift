//
//  FavoritesCoordinator.swift
//  ZooMall
//
//  Created by Aram Martirosyan on 25.06.22.
//

import UIKit

class FavouritesCoordinator: Coordinator {
    let navigationController: CoordinatedNavigationController
    
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController()) {
        self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.coordinator = self
        
        let viewController = FavouritesViewController()
        viewController.tabBarItem = UITabBarItem(
            title: "Favourite", image: UIImage(systemName: "heart"), tag: 1
        )
        viewController.coordinator = self
        navigationController.viewControllers = [viewController]
    }
}

