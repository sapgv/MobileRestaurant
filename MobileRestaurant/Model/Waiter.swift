//
//  Waiter.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class Waiter: Codable {
    
    let name: String
    
    let image: String
    
    init(
        name: String,
        image: String
    ) {
        self.name = name
        self.image = image
    }
    
}

extension Waiter {
    
    static var arrayPreview: [Waiter] {
        [
            Waiter(name: "Екатерина", image: "w1"),
            Waiter(name: "Олеся", image: "w2"),
            Waiter(name: "Анна", image: "w3"),
            Waiter(name: "Света", image: "w4"),
        ]
    }
    
}
