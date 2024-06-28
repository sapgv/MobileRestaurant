//
//  BottomOrderView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import SwiftUI

struct BottomOrderView: View {
    
    var itemCount: Int
    
    var value: Decimal
    
    var action: (() -> Void)? = nil
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            Text("\(itemCount) позиции(й), на сумму ")
            
            Spacer()
            
            Text("\(value) р")
                .font(.title2)

            Spacer()
            
            Button {
                action?()
            } label: {
                Text("Сделать заказ")
            }
            .tint(.green)
            .buttonStyle(.borderedProminent)
            
        }
        
    }
}

#Preview {
    BottomOrderView(itemCount: 5, value: 1200)
}
