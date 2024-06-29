//
//  ShiftDetailViewModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class ShiftDetailViewModel: ObservableObject {
    
    @Published var shift: Shift
    
    init(shift: Shift) {
        self.shift = shift
    }
    
}
