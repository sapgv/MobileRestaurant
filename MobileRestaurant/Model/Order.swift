//
//  Order.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import Foundation

final class Order {
 
    let date: Date
    
    let id: UUID
    
    private(set) var items: [OrderItem] = []
    
    init(
        id: UUID = UUID(),
        date: Date = Date(),
        items: [OrderItem] = []
    ) {
        self.id = id
        self.date = date
        self.items = items
    }
    
}
