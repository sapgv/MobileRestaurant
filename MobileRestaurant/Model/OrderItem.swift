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
