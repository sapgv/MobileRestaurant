//
//  OrderStatusListView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct OrderStatusListView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var action: ((OrderStatus) -> Void)?
    
    var currentStatus: OrderStatus
    
    var body: some View {
        
        NavigationStack {
            
            List {
                
                ForEach(OrderStatus.allCases, id: \.self) { status in
                    
                    HStack {
                        Text(status.rawValue)
                        Spacer()
                        if status == currentStatus {
                            Image(systemName: "checkmark")
                                .foregroundStyle(Color.blue)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.action?(status)
                        dismiss()
                    }
                }
                
                
            }
            .navigationTitle("Выберите статус")
            
            
        }
        
    }
}

#Preview {
    OrderStatusListView(currentStatus: .new)
}
