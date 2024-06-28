//
//  OrderItem.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import Foundation

final class OrderItem {
 
    let product: Product
    
    var count: Int = 1
    
    init(
        product: Product,
        count: Int
    ) {
        self.product = product
        self.count = count
    }
    
}
