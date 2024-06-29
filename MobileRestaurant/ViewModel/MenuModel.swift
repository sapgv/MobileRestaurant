//
//  MenuModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class MenuModel: ObservableObject {
    
    @Published private(set) var list: [ProductCategory]
    
    init(list: [ProductCategory] = ProductCategory.createList()) {
        self.list = list
    }
    
}
