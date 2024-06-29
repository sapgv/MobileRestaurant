//
//  OrderModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation
import SwiftUI
import Combine

final class OrderModel: ObservableObject {
    
    @Published private(set) var order: Order
    
    @Published var desk: Desk? {
        didSet {
            Storage.shared.desk = desk
        }
    }
    
    @Published private(set) var items: [OrderItem] = []
    
    var value: Decimal {
        self.items.reduce(0, { $0 + $1.value })
    }
    
    init(
        order: Order = Order(),
        desk: Desk? = Storage.shared.desk
    ) {
        self.order = order
        self.desk = desk
    }
    
    func add(product: Product) {
        if let item = self.items.first(where: { $0.product == product }) {
            item.count += 1
        }
        else {
            self.items.append(OrderItem(product: product, count: 1))
        }
//        self.order.add(product: product)
//        self.objectWillChange.send()
    }
    
}
