//
//  OrderModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class OrderModel: ObservableObject {
    
    @Published private(set) var order: Order
    
    init(order: Order = Order()) {
        self.order = order
    }
    
    func add(product: Product) {
        self.order.add(product: product)
        self.objectWillChange.send()
    }
    
}
