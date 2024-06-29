//
//  ShiftModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class CurrentShiftModel: ObservableObject {
    
    @Published private(set) var currentShift: Shift
    
    init(currentShift: Shift = Storage.shared.currentShift) {
        self.currentShift = currentShift
    }
    
}
