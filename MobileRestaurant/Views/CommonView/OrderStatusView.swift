//
//  OrderStatusView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct OrderStatusView: View {
    
    var status: OrderStatus
    
    var body: some View {
        Text(status.rawValue)
            .padding(4)
            .background {
                Color(uiColor: status.color)
            }
            .foregroundStyle(Color.white)
            .font(.caption)
            .clipShape(RoundedRectangle(cornerRadius: 3))
    }
}

#Preview {
    OrderStatusView(status: Order.preview.status)
}
