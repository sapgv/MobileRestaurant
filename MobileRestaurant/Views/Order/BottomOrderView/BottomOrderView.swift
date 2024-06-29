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
        
        Button(action: {
            
            action?()
            
        }, label: {
            
            HStack(alignment: .center) {
                
                Text("Корзина")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(uiColor: .white.withAlphaComponent(0.5)))
                
                Spacer()
                
                Text("\(value) р")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                
            }
            .padding(6)
            .background {
                Color.green
            }
            
        })
        
    }
}

#Preview {
    BottomOrderView(itemCount: 5, value: 1200)
}
