//
//  AccountViewModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class AccountViewModel: ObservableObject {
    
    @Published private(set) var orders: [Order]
    
    init(orders: [Order] = [Order.preview]) {
        self.orders = orders
    }
    
}
