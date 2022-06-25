//
//  BaseCollectionViewController.swift
//  ZooMall
//
//  Created by Aram Martirosyan on 25.06.22.
//

import UIKit

class BaseCollectionViewController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        initNavigationBar()
    }
    
    func initNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemYellow
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}

