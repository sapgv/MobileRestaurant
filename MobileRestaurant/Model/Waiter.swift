//
//  Waiter.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class Waiter: Identifiable, Codable {
    
    var id: String {
        self.name
    }
    
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
    
    static var preview: Waiter {
        arrayPreview[0]
    }
    
    static var arrayPreview: [Waiter] {
        [
            Waiter(name: "Екатерина", image: "w1"),
            Waiter(name: "Олеся", image: "w2"),
            Waiter(name: "Анна", image: "w3"),
            Waiter(name: "Света", image: "w4"),
        ]
    }
    
}
