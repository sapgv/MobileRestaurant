//
//  ProductUnit.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import Foundation

enum ProductUnit: Hashable {
    
    case item
    
    case wight(Decimal = 100)
    
    var title: String {
        switch self {
        case .item:
            return "1 шт"
        case let .wight(value):
            return "\(value) г"
        }
    }
    
}
