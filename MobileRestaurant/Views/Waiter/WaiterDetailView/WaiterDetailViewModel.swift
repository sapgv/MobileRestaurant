//
//  WaiterDetailViewModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class WaiterDetailViewModel: ObservableObject {
    
    @Published var waiter: Waiter
    
    init(waiter: Waiter) {
        self.waiter = waiter
    }
    
}
