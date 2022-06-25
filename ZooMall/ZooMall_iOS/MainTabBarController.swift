//
//  MainTabBarController.swift
//  ZooMall
//
//  Created by Aram Martirosyan on 23.06.22.
//

import UIKit

class MainTabBarController: UITabBarController {
    let homeCoordinator = HomeCoordinator()
    let favouriteCoordinator = FavouritesCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            homeCoordinator.navigationController,
            favouriteCoordinator.navigationController
        ]
        
        setAppearance()
    }
    
    func setAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .systemYellow
        
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        } else {
            // Fallback on earlier versions
        }
    }
}

