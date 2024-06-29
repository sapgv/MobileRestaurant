//
//  WaiterOrderDetailModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class WaiterOrderDetailModel: ObservableObject {
    
    @Published var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    func update(status: OrderStatus) {
        self.order.update(status: status)
    }
    
}
