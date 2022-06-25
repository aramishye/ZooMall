//
//  AlsoLikeCell.swift
//  ZooMall
//
//  Created by Aram Martirosyan on 25.06.22.
//

import UIKit

class AlsoLikeCell: BaseCell {
    private var nameLabel: UILabel!
    
    override func initViews() {
        backgroundColor = .blue
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(data: String) {
        nameLabel.text = data
    }
}

