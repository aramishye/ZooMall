//
//  HomeViewController.swift
//  ZooMall
//
//  Created by Aram Martirosyan on 25.06.22.
//

import UIKit

class HomeViewController: BaseCollectionViewController {
    static let sectionHeaderElementKind = "section-header-element-kind"
    
    var coordinator: HomeCoordinator?
    var dataSource = HomeDataSource()
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(coordinator != nil, "You must set a coordinator before presenting this view controller.")
        
        collectionView.dataSource = dataSource
        collectionView.collectionViewLayout = makeLayout()
        collectionView.register(
            BrandCell.self,
            forCellWithReuseIdentifier: "BrandCell"
        )
        collectionView.register(
            AlsoLikeCell.self,
            forCellWithReuseIdentifier: "AlsoLikeCell"
        )
        collectionView.register(
            HeaderView.self,
            forSupplementaryViewOfKind: HomeViewController.sectionHeaderElementKind,
            withReuseIdentifier: HeaderView.reuseIdentifier
        )
                
        title = "Home"
        dataSource.delegate = self
    }
    
    // MARK: - Layout
    private func makeLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (section, _) in
            switch self.dataSource.sections[section].type {
            case .brands:
                return self.createBrandSection()
            case .alsoLike:
                return self.alsoLikeSection()
            }
        }
        return layout
    }
    
    private func createBrandSection() -> NSCollectionLayoutSection {
        // MARK: - Creating item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // MARK: - Creating group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.4),
            heightDimension: .fractionalWidth(0.4)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize, subitem: item, count: 1
        )
        group.contentInsets = NSDirectionalEdgeInsets(
            top: 5, leading: 5, bottom: 5, trailing: 5
        )

        // MARK: - Creating Header
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
          layoutSize: headerSize,
          elementKind: HomeViewController.sectionHeaderElementKind,
          alignment: .top
        )

        // MARK: - Creating section
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .groupPaging

        return section
    }
    
    private func alsoLikeSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        // MARK: - Item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(0.5)
        )
        
        // MARK: - Group
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize, subitem: item, count: 2
        )
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: HomeViewController.sectionHeaderElementKind,
            alignment: .top
        )
        
        // MARK: - Section
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        coordinator?.showItemDetailScene()
    }
}

extension HomeViewController: HomeDataSourceDelegate {
    func updateInfo() {
        collectionView.reloadData()
    }
}

