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
    
    init(
        order: Order = Order(),
        desk: Desk? = Storage.shared.desk
    ) {
        self.order = order
        self.desk = desk
    }
    
    func add(product: Product) {
        self.order.add(product: product)
        self.objectWillChange.send()
    }
    
}
