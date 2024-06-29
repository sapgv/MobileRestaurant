//
//  ClientMenuOrderModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class ClientMenuOrderModel: ObservableObject {
    
    @Published private(set) var list: [ProductCategory]
    
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
        desk: Desk? = Storage.shared.desk,
        list: [ProductCategory] = ProductCategory.createList()
    ) {
        self.desk = desk
        self.list = list
    }
    
    func add(product: Product) {
        if let item = self.items.first(where: { $0.product == product }) {
            item.count += 1
        }
        else {
            self.items.append(OrderItem(product: product, count: 1))
        }
        self.objectWillChange.send()
    }
    
    func reset() {
        self.items.removeAll()
    }
    
}
