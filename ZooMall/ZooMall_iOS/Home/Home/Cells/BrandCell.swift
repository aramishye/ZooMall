//
//  BrandCell.swift
//  ZooMall
//
//  Created by Aram Martirosyan on 25.06.22.
//

import UIKit

protocol BrandCellDelegate: AnyObject {
    func likeButtonPressed(with brand: Brand)
}

class BrandCell: BaseCell {
    weak var delegate: BrandCellDelegate?
    var nameLabel: UILabel!
    var likeButton: UIButton!
    private var data: Brand!
        
    override func initViews() {
        backgroundColor = .red
        
        initNabeLabel()
        initLikeButton()
        constructHierarchy()
        activateConstraints()
        
        likeButton.addTarget(
            self, action: #selector(likeButtonPressed), for: .touchUpInside
        )
    }
    
    func set(data: Brand) {
        self.data = data
        nameLabel.text = data.name
        let isFavourite = data.isFavourite ?? false
        
        if isFavourite {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    @objc func likeButtonPressed() {
        delegate?.likeButtonPressed(with: self.data)
    }
    
}

// MARK: - Layout
extension BrandCell {
    private func initNabeLabel() {
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initLikeButton() {
        likeButton = UIButton(type: .system)
        likeButton.setImage(
            UIImage(systemName: "heart"),
            for: .normal
        )
        likeButton.tintColor = .black
        likeButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func constructHierarchy() {
        addSubview(nameLabel)
        addSubview(likeButton)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            likeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            likeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}

