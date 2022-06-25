//
//  FavoritesViewController.swift
//  ZooMall
//
//  Created by Aram Martirosyan on 25.06.22.
//

import UIKit

class FavouritesViewController: UIViewController {
    var coordinator: FavouritesCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        title = "Favourites"
    }
}

