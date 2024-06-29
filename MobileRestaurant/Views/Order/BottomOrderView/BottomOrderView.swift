//
//  BottomOrderView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import SwiftUI

struct BottomOrderView: View {
    
    var value: Decimal
    
    var action: (() -> Void)? = nil
    
    var body: some View {
        
        BottomActionView {
            self.action?()
        } content: {
            
            HStack(alignment: .center) {
                
                Text("Корзина")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(uiColor: .white.withAlphaComponent(0.5)))
                
                Spacer()
                
                Text("\(self.value) р")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                
            }
            .padding(8)
            .background {
                Color.green
            }
            
        }
        
    }
}

#Preview {
    BottomOrderView(value: 1200)
}
