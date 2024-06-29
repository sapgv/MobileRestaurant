//
//  ConfirmCreateOrderView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct ConfirmCreateOrderView: View {
    
    @EnvironmentObject var model: CreateOrderModel
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            List {
                
                VStack {
                 
                    HStack {
                        Spacer()
                        Text(model.date.formatted(date: .complete, time: .omitted))
                            .foregroundStyle(.secondary)
                    }
                    
                    HStack(alignment: .center) {
                        Spacer()
                        Text("\(model.value) р")
                            .font(.title)
                        
                    }
                    
                }
                
            }
            
            BottomActionView {
                self.model.createOrder()
                
            } content: {
                
                Text("Оформить заказ")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(uiColor: .white.withAlphaComponent(0.5)))
                    .frame(maxWidth: .infinity)
                
                .padding()
                .background {
                    Color.green
                }
                
            }
            
        }
        .navigationTitle("Заказ")
        
    }
}

#Preview {
    let model = CreateOrderModel(items: OrderItem.arrayPreview)
    return ConfirmCreateOrderView()
        .environmentObject(model)
}
