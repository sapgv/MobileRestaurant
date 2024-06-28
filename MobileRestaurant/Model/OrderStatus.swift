//
//  OrderStatus.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import UIKit

enum OrderStatus: String {
    
    case new = "Новый"
    case cooking = "Готовится"
    case ready = "Готов"
    case serviced = "Выполнен"
    case canceled = "Отменен"
    
    var color: UIColor {
        switch self {
        case .new:
            return .systemBlue
        case .cooking:
            return .systemYellow
        case .ready:
            return .systemOrange
        case .serviced:
            return  .systemGreen
        case .canceled:
            return .systemRed
        }
    }
    
}
