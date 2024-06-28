//
//  ProductCategory.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import Foundation

final class ProductCategory {
    
    let name: String
    
    let products: [Product]
    
    init(name: String, products: [Product]) {
        self.name = name
        self.products = products
    }
    
}
