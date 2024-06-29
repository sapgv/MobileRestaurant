//
//  OrderItem.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import Foundation

final class OrderItem: Codable {
 
    let product: Product
    
    var count: Int = 1
    
    var value: Decimal {
        self.product.price * Decimal(self.count)
    }
    
    var unit: String {
        self.product.unit.value(count: self.count)
    }
    
    init(
        product: Product,
        count: Int
    ) {
        self.product = product
        self.count = count
    }
    
}

extension OrderItem {
    
    static var arrayPreview: [OrderItem] {
        
        return Product.arrayPreview.map { product in
            OrderItem(product: product, count: Int.random(in: 1...5))
        }
        
    }
    
    static func preview(_ index: Int) -> OrderItem {
        self.arrayPreview[index]
    }
    
    static var preview: OrderItem {
        
        return arrayPreview[0]
        
    }
    
}
