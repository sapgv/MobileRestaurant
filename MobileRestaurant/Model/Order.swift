//
//  Order.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import Foundation

final class Order {
 
    let id: UUID
    
    let date: Date
    
    private(set) var status: OrderStatus
    
    var value: Decimal {
        self.items.reduce(0, { $0 + $1.value })
    }
    
    private(set) var items: [OrderItem] = []
    
    init(
        id: UUID = UUID(),
        date: Date = Date(),
        status: OrderStatus = .new,
        items: [OrderItem] = []
    ) {
        self.id = id
        self.date = date
        self.status = status
        self.items = items
    }
    
    func add(product: Product) {
        if let item = self.items.first(where: { $0.product == product }) {
            item.count += 1
        }
        else {
            self.items.append(OrderItem(product: product, count: 1))
        }
    }
    
}
