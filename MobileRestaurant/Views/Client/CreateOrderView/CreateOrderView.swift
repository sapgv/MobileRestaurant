//
//  CreateOrderView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct CreateOrderView: View {
    
    @EnvironmentObject var model: CreateOrderModel
    
    @State private var showPayView: Bool = false
    
    var body: some View {
        
        NavigationStack {
         
            VStack(spacing: 0) {
                
                List {
                    
                    ForEach(model.items, id: \.product) { item in
                        
                        OrderItemListView(orderItem: item)
                        
                    }
                    
                    HStack {
                        Text("Итого")
                        Spacer()
                        Text("\(model.value) р")
                            .font(.title2)
                    }
                }
                
                NextButtonView {
                    self.showPayView = true
                }
                
            }
                
            .navigationTitle("Новый заказ")
            .navigationDestination(isPresented: self.$showPayView) {
                CreateOrderPayView()
            }
            
        }
        
    }
}

#Preview {
    let model = CreateOrderModel(items: OrderItem.arrayPreview)
    return CreateOrderView()
        .environmentObject(model)
}
