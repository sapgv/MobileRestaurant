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
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            Text("\(itemCount) позиции(й), на сумму ")
            
            Spacer()
            
            Text("\(value) р")
                .font(.title)

            Spacer()
            
            Button {
                
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
