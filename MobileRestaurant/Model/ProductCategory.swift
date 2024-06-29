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

extension ProductCategory {
    
    static func createList() -> [ProductCategory] {
        
        let list: [ProductCategory] = [
        
            ProductCategory(name: "МИДИИ", products: [
                Product(name: "Мидии белое вино, петрушка", price: 450, image: "1", netto: "450/30/70г"),
                Product(name: "Мидии пармезан, сливки", price: 550, image: "2", netto: "450/30/70г"),
                Product(name: "Мидии в томатном соусе", price: 650, image: "3", netto: "450/30/70г"),
            ]),
            
            ProductCategory(name: "УСТРИЦЫ", products: [
                Product(name: "Запеченная устрица", price: 350, image: "4"),
                Product(name: "Розовая Джоли (Намибия)", price: 440, image: "5"),
            ]),
            
            ProductCategory(name: "МОРЕПРОДУКТЫ НА ЛЬДУ", products: [
                Product(name: "Сет 1", price: 2350, image: "6", netto: "80/100/50/65г", description: "Сашими лосось, тунец, угорь, гребешок"),
                Product(name: "Сет 2", price: 3550, image: "7", netto: "300/80/100/65/100г", description: "Императорские устрицы, креветки подкопченные магаданские и тигровые, сашими лосось, сашими тунец, тар-тар из гребешка, лимон"),
                Product(name: "Сашими Тунец", price: 520, unit: .wight(100), image: "8", netto: "100г"),
            ])
        
        ]
        
        return list
        
    }
    
}


