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
    
    @Published var orderType: OrderType? = nil
    
    @Published var orderPayType: OrderPayType? = nil
    
    @Published var items: [OrderItem] = []
 
    var value: Decimal {
        self.items.reduce(0, { $0 + $1.value })
    }
    
    init(
        date: Date = Date(),
        orderType: OrderType? = nil,
        orderPayType: OrderPayType? = nil,
        desk: Desk? = nil,
        items: [OrderItem] = []
    ) {
        self.date = date
        self.orderType = orderType
        self.orderPayType = orderPayType
        self.desk = desk
        self.items = items
    }
    
    func createOrder() {
        
        let order = Order(
            date: date,
            desk: desk,
            orderType: orderType,
            orderPayType: orderPayType,
            items: items
        )
        
        Storage.shared.orders.append(order)
        
        NotificationCenter.default.post(name: .didCreateOrder, object: nil)
        
        self.items.removeAll()
                          
    }
    
}
