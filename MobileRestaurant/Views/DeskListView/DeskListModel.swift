//
//  DeskListModel.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import Foundation

final class DeskListModel: ObservableObject {
 
    @Published private(set) var list: [Desk]
    
    init(list: [Desk] = Desk.arrayPreview) {
        self.list = list
    }
    
}
