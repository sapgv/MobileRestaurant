//
//  AdminDeskListModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class AdminDeskListModel: ObservableObject {
    
    @Published var list: [Desk]
    
    init(list: [Desk] = Storage.shared.desks) {
        self.list = list
    }
    
}
