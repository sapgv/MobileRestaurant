//
//  Desk.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class Desk: Hashable, Codable {
   
    let name: String
    
    let places: Int
    
    init(name: String, places: Int) {
        self.name = name
        self.places = places
    }
    
}

extension Desk {
 
    static func == (lhs: Desk, rhs: Desk) -> Bool {
        lhs.name == rhs.name
    }
 
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
}
    

extension Desk {
    
    static var arrayPreview: [Desk] {
        
        [
            Desk(name: "Стол 1", places: 2),
            Desk(name: "Стол 2", places: 2),
            Desk(name: "Стол 3", places: 3),
            Desk(name: "Стол 4", places: 3),
            Desk(name: "Стол 5", places: 4),
            Desk(name: "Стол 6", places: 6),
            Desk(name: "Стол 7", places: 8),
            Desk(name: "Стол 8", places: 10),
        
        ]
        
    }
    
    static var preview: Desk {
        Desk(name: "1", places: 2)
    }
    
}
