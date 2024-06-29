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
    
    static var arrayPreview: [Product] {
        
        [
            Product(name: "Мидии белое вино, петрушка", price: 850, image: "1", netto: "450/30/70г"),
            Product(name: "Мидии пармезан, сливки", price: 850, image: "2", netto: "450/30/70г"),
            Product(name: "Мидии в томатном соусе", price: 850, image: "3", netto: "450/30/70г"),
            Product(name: "Запеченная устрица", price: 350, image: "4"),
            Product(name: "Розовая Джоли (Намибия)", price: 440, image: "5"),
            Product(name: "Сет 1", price: 2350, image: "6", netto: "80/100/50/65г", description: "Сашими лосось, тунец, угорь, гребешок"),
            Product(name: "Сет 2", price: 3550, image: "7", netto: "300/80/100/65/100г", description: "Императорские устрицы, креветки подкопченные магаданские и тигровые, сашими лосось, сашими тунец, тар-тар из гребешка, лимон"),
            Product(name: "Сашими Тунец", price: 520, unit: .wight(100), image: "8", netto: "100г"),
        ]
        
    }
    
    static func preview(_ index: Int) -> Product {
        self.arrayPreview[index]
    }
    
    static var preview: Product {
        
        Product(name: "Сет 2", price: 3550, image: "7", netto: "300/80/100/65/100г", description: "Императорские устрицы, креветки подкопченные магаданские и тигровые, сашими лосось, сашими тунец, тар-тар из гребешка, лимон")
        
    }
    
}
