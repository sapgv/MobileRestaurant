//
//  ClientOrderListModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import Foundation

final class ClientOrderListModel: ObservableObject {
 
    @Published private(set) var orders: [Order]
    
    init(orders: [Order] = Storage.shared.orders) {
        self.orders = orders
        NotificationCenter.default.addObserver(self, selector: #selector(didCreateOrder), name: .didCreateOrder, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeOrderStatus), name: .didChangeOrderStatus, object: nil)
    }
    
    @objc
    private func didCreateOrder() {
        self.orders = Storage.shared.orders
    }
    
    @objc
    private func didChangeOrderStatus() {
        self.orders = Storage.shared.orders
    }
    
}
