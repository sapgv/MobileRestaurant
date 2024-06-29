//
//  Storage.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class Storage {
    
    static let shared = Storage()
    
    var currentShift: Shift {
        self.shifts[0]
    }
    
    var desks: [Desk] {
        get {
            guard let data = UserDefaults.standard.value(forKey: "desks") as? Data else {
                return []
            }
            let decoder = JSONDecoder()
            let value = (try? decoder.decode([Desk].self, from: data)) ?? []
            return value
        }
        set {
            let decoder = JSONEncoder()
            let data = try? decoder.encode(newValue)
            UserDefaults.standard.setValue(data, forKey: "desks")
            UserDefaults.standard.synchronize()
        }
    }
    
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
    
    var shifts: [Shift] {
        get {
            guard let data = UserDefaults.standard.value(forKey: "shifts") as? Data else {
                return []
            }
            let decoder = JSONDecoder()
            let value = (try? decoder.decode([Shift].self, from: data)) ?? []
            return value
        }
        set {
            let decoder = JSONEncoder()
            let data = try? decoder.encode(newValue)
            UserDefaults.standard.setValue(data, forKey: "shifts")
            UserDefaults.standard.synchronize()
        }
    }
    
    var waiters: [Waiter] {
        
        get {
            guard let data = UserDefaults.standard.value(forKey: "waiters") as? Data else {
                return []
            }
            let decoder = JSONDecoder()
            let value = (try? decoder.decode([Waiter].self, from: data)) ?? []
            return value
        }
        set {
            let decoder = JSONEncoder()
            let data = try? decoder.encode(newValue)
            UserDefaults.standard.setValue(data, forKey: "waiters")
            UserDefaults.standard.synchronize()
        }
        
    }
    
    
}

extension Storage {
    
    func restore() {
        
        if self.waiters.isEmpty {
            self.waiters = Waiter.arrayPreview
        }
        
        if self.desks.isEmpty {
            self.desks = Desk.arrayPreview
        }
        
        if self.shifts.isEmpty {
            self.shifts = Shift.arrayPreview
        }
        
    }
    
}
