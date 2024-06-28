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
    
    private(set) var payStatus: OrderPayStatus
    
    var value: Decimal {
        self.items.reduce(0, { $0 + $1.value })
    }
    
    private(set) var items: [OrderItem] = []
    
    init(
        id: UUID = UUID(),
        date: Date = Date(),
        status: OrderStatus = .new,
        payStatus: OrderPayStatus = .needPay,
        items: [OrderItem] = []
    ) {
        self.id = id
        self.date = date
        self.status = status
        self.payStatus = payStatus
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

extension Order {
    
    static var preview: Order {
        
        let item = OrderItem(product: Product.preview, count: 3)
        
        let order = Order(items: [item])
        
        return order
        
    }
    
}
