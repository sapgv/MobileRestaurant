//
//  CreateOrderModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class CreateOrderModel: ObservableObject {
    
    @Published var date: Date
    
    @Published var desk: Desk? = nil
    
    @Published var items: [OrderItem] = []
 
    var value: Decimal {
        self.items.reduce(0, { $0 + $1.value })
    }
    
    init(
        date: Date = Date(),
        desk: Desk? = nil,
        items: [OrderItem] = []
    ) {
        self.date = date
        self.desk = desk
        self.items = items
    }
    
    func createOrder() {
        
        let order = Order(date: date, desk: desk, items: items)
        
        Storage.shared.orders.append(order)
                          
    }
    
}
