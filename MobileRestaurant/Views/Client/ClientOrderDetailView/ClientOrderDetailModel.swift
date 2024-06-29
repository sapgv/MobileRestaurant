//
//  ClientOrderDetailModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class ClientOrderDetailModel: ObservableObject {
    
    @Published private(set) var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
}
