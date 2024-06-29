//
//  WaiterOrderListModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class WaiterOrderListModel: ObservableObject {
    
    @Published var waiter: Waiter
    
    @Published var orders: [Order] = []
    
    init(waiter: Waiter, orders: [Order] = Storage.shared.orders) {
        self.waiter = waiter
        self.orders = orders
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeOrderStatus), name: .didChangeOrderStatus, object: nil)
    }
    
    @objc
    private func didChangeOrderStatus() {
        self.orders = Storage.shared.orders
    }
    
}
