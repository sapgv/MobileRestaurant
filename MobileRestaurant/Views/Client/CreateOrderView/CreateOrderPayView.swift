//
//  CreateOrderPayView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct CreateOrderPayView: View {
    
    @EnvironmentObject var model: CreateOrderModel
    
    @State private var showConfirmOrder: Bool = false
    
    @Binding var showCreateOrder: Bool
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            List {
                
                Picker("", selection: $model.orderPayType) {
                    ForEach(OrderPayType.allCases, id: \.self) { payType in
                        Text(payType.rawValue)
                            .tag(Optional(payType))
                    }
                }
                .pickerStyle(.inline)
                
            }
            
            NextButtonView {
                self.showConfirmOrder = true
            }
            .navigationTitle("Оплата")
            .navigationDestination(isPresented: self.$showConfirmOrder) {
                ConfirmCreateOrderView(showCreateOrder: $showCreateOrder)
            }
            
        }
        
        
    }
}

#Preview {
    CreateOrderPayView(showCreateOrder: .constant(false))
}
