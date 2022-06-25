//
//  HomeCoordinator.swift
//  ZooMall
//
//  Created by Aram Martirosyan on 23.06.22.
//

import UIKit

class HomeCoordinator: Coordinator {
    let navigationController: CoordinatedNavigationController
    
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController()) {
        self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.coordinator = self
        
        let viewController = HomeViewController()
        viewController.tabBarItem = UITabBarItem(
            title: "Home", image: UIImage(systemName: "house"), tag: 0
        )
        viewController.coordinator = self
        
        navigationController.viewControllers = [viewController]
    }
    
    func showItemDetailScene() {
        let viewController = ItemDetailViewController()
        navigationController.pushViewController(
            viewController, animated: true
        )
    }
}

