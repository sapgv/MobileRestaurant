//
//  OrderPayType.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

enum OrderPayType: String, CaseIterable, Codable {
    
    case cash = "Наличные"
    case card = "Картой при получении"
    case online = "Онлайн"
    
}
