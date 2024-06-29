//
//  ShiftListViewModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class ShiftListViewModel: ObservableObject {
    
    private(set) var shifts: [Shift] = []
    
    init(shifts: [Shift] = Storage.shared.shifts) {
        self.shifts = shifts
    }
    
}
