//
//  BottomOrderViewModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import Foundation

private class BottomOrderViewModel: ObservableObject {
    
    @Published var order: Order
    
    var items: String {
        "\(self.order.items.count)"
    }
    
     var value: Decimal {
        0
    }
    
    init(order: Order) {
        self.order = order
    }
    
}
