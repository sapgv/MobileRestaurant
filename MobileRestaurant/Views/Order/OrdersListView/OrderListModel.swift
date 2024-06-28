//
//  OrdersListModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import Foundation

final class OrdersListModel: ObservableObject {
 
    @Published private(set) var orders: [Order]
    
    init(orders: [Order] = []) {
        self.orders = orders
    }
    
    func add(order: Order) {
        self.orders.append(order)
    }
    
}
