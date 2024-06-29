//
//  Shift.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class Shift: Codable {
    
    let date: Date
    
    var data: [Desk: Waiter]
    
    init(date: Date, data: [Desk: Waiter] = [:]) {
        self.date = date
        self.data = data
    }
    
}

extension Shift {
    
    static var preview: Shift {
        
        arrayPreview[0]
        
    }
    
    static var arrayPreview: [Shift] {
        
        var data: [Desk: Waiter] = [:]
        
        let desks = Storage.shared.desks
        
        let waiters = Storage.shared.waiters
        
        for desk in desks {
            data[desk] = waiters[Int.random(in: 0...3)]
        }
        
        return [
            Shift(date: Date(), data: data)
        ]
        
    }
    
}
