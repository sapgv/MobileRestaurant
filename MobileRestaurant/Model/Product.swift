//
//  Product.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import Foundation

final class Product: Hashable {
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    let name: String
    
    let price: Decimal
    
    let image: String
    
    let netto: String
    
    let description: String
    
    let unit: ProductUnit
    
    init(
        name: String,
        price: Decimal,
        unit: ProductUnit = .item,
        image: String,
        netto: String = "",
        description: String = ""
    ) {
        self.name = name
        self.price = price
        self.unit = unit
        self.image = image
        self.netto = netto
        self.description = description
    }
    
}
