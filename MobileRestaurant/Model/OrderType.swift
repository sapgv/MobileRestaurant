//
//  OrderType.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

enum OrderType: String, CaseIterable {
    case restaurant = "В ресторане"
    case toGo = "На вынос"
    case delivery = "Доставка"
}
