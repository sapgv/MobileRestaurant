//
//  OrderPayStatus.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import UIKit

enum OrderPayStatus: String {
    
    case paided = "Оплачен"
    
    case needPay = "Требуется оплата"
    
    var color: UIColor {
        switch self {
        case .needPay:
            return .systemRed
        case .paided:
            return .systemGreen
        }
    }
    
}
