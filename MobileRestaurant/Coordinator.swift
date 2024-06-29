//
//  Coordinator.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import SwiftUI

final class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    
}

extension Coordinator {
    
    enum MenuList: Hashable {
        case product(Product)
        case selectDesk
    }
    
}
