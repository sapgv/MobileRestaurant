//
//  OrderAccountStatus.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import UIKit

enum OrderAccountStatus: String {
    
    case `default` = "Не выгружен"
    
    case uploaded = "Выгружен"
    
    var color: UIColor {
        switch self {
        case .default:
            return .systemRed
        case .uploaded:
            return .systemGreen
        }
    }
    
}

