//
//  ItemDetailViewController.swift
//  ZooMall
//
//  Created by Aram Martirosyan on 25.06.22.
//

import UIKit

class ItemDetailViewController: UIViewController {
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    var headerImageView: UIImageView!
    var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        initScrollView()
        initStackView()
        initHeaderImageView()
        initInfoLabel()
        constructHierarchy()
        activateConstraints()
    }
}

// MARK: - Layout
extension ItemDetailViewController {
    private func initScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initStackView() {
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initHeaderImageView() {
        headerImageView = UIImageView()
        headerImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        headerImageView.backgroundColor = .blue
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initInfoLabel() {
        infoLabel = UILabel()
        infoLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        infoLabel.numberOfLines = 0
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func constructHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(headerImageView)
        stackView.addArrangedSubview(infoLabel)
    }
    
    private func activateConstraints() {
        let contentLayoutGuide = scrollView.contentLayoutGuide
        let frameLayoutGuide = scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor),
            stackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor, constant: -15)
        ])
    }
    
}

