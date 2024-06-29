//
//  ClientOrderListRow.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct ClientOrderListRow: View {
    
    var order: Order
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
         
            HStack {
                OrderStatusView(status: order.status)
                Spacer()
                Text(order.date.formatted(date: .complete, time: .omitted))
                    .foregroundStyle(.secondary)
            }
            
            HStack(alignment: .center) {
                Text(order.title)
                    .font(.title2)
                Spacer()
                Text("\(order.value) р")
                    .font(.title)
                
            }
            
        }
        
    }
}

#Preview {
    ClientOrderListRow(order: Order.preview)
}
