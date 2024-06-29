//
//  ClientOrderListPayView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct ClientOrderListPayView: View {
    
    var order: Order
    
    var body: some View {
        
        HStack {
            
            Text(order.payStatus.rawValue)
            
            Spacer()
            
            Text("\(order.value) р")
                .font(.title2)
                .foregroundStyle(Color(uiColor: order.payStatus.color))
            
        }
        
    }
}

#Preview {
    ClientOrderListPayView(order: Order.preview)
}
