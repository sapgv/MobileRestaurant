//
//  OrderViewModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import Foundation

final class OrderViewModel: ObservableObject {
    
    @Published private(set) var order: Order = Order()
    
    private(set) var list: [ProductCategory]
    
    init(list: [ProductCategory] = ProductCategory.createList()) {
        self.list = list
    }
    
    func add(product: Product) {
        self.order.add(product: product)
        self.objectWillChange.send()
    }
    
}
