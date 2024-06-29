//
//  Storage.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class Storage {
    
    static let shared = Storage()
    
    var desk: Desk? {
        get {
            guard let data = UserDefaults.standard.value(forKey: "desk") as? Data else {
                return nil
            }
            let decoder = JSONDecoder()
            let value = try? decoder.decode(Desk.self, from: data)
            return value
        }
        set {
            let decoder = JSONEncoder()
            let data = try? decoder.encode(newValue)
            UserDefaults.standard.setValue(data, forKey: "desk")
            UserDefaults.standard.synchronize()
        }
    }
    
    var orders: [Order] {
        get {
            guard let data = UserDefaults.standard.value(forKey: "orders") as? Data else {
                return []
            }
            let decoder = JSONDecoder()
            let value = (try? decoder.decode([Order].self, from: data)) ?? []
            return value
        }
        set {
            let decoder = JSONEncoder()
            let data = try? decoder.encode(newValue)
            UserDefaults.standard.setValue(data, forKey: "orders")
            UserDefaults.standard.synchronize()
        }
    }
    
}

