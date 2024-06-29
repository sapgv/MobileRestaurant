//
//  Product.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import Foundation

final class Product: Hashable, Codable {
    
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

extension Product {
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
}

extension Product {
    
    static var preview: Product {
        
        Product(name: "Сет 2", price: 3550, image: "7", netto: "300/80/100/65/100г", description: "Императорские устрицы, креветки подкопченные магаданские и тигровые, сашими лосось, сашими тунец, тар-тар из гребешка, лимон")
        
    }
    
}
