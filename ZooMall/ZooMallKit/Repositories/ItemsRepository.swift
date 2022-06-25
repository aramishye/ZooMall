//
//  ItemsRepository.swift
//  ZooMall
//
//  Created by Aram Martirosyan on 25.06.22.
//

import Foundation

protocol ItemsRepositoryDelegate: AnyObject {
    func updateBrands(brands: [Brand])
}

class ItemsRepository {
    weak var delegate: ItemsRepositoryDelegate?
    let service = ItemsService()
    private var brands: [Brand] = []
    
//    var brands: [Brand] {
//        get {
//            return _brands
//        }
//        set {
//            _brands = newValue
//        }
//    }
    
    static var shared: ItemsRepository = ItemsRepository()
    
    private init() {
        brands = service.itemData.data.brands
        delegate?.updateBrands(brands: brands)
    }
    
    func set(brand: Brand) {
         for (index, item) in brands.enumerated() {
            if item.id == brand.id {
                let isFav = brands[index].isFavourite ?? false
                brands[index].isFavourite = !isFav
            }
        }
        delegate?.updateBrands(brands: brands)
    }

    func getBrands() -> [Brand] {
        return brands
    }
}

