//
//  WaiterOrderListRow.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct WaiterOrderListRow: View {
    
    var order: Order
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
         
            HStack {
                
                Spacer()
                Text(order.date.formatted(date: .complete, time: .omitted))
                    .foregroundStyle(.secondary)
            }
            
            HStack(alignment: .center) {
                Text(order.title)
                    .font(.title2)
                Spacer()
                OrderStatusView(status: order.status)
                    .font(.title2)
                
            }
            
        }
        
    }
    
}

#Preview {
    WaiterOrderListRow(order: Order.preview)
}
