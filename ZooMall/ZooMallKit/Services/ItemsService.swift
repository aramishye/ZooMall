//
//  ItemsService.swift
//  ZooMall
//
//  Created by Aram Martirosyan on 25.06.22.
//

import Foundation

class ItemsService {
    var itemData = Bundle.main.decode(ItemData.self, from: "Items.json")
}

