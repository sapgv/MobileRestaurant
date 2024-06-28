//
//  MenuListModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import Foundation

final class MenuListModel: ObservableObject {
 
    private(set) var order: Order = Order()
    
    private(set) var list: [ProductCategory]
    
    init(list: [ProductCategory] = ProductCategory.createList()) {
        self.list = list
    }
    
}

