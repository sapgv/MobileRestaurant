//
//  CreateOrderView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct CreateOrderView: View {
    
    @EnvironmentObject var model: CreateOrderModel
    
    var body: some View {
        
        List {
            
            ForEach(model.order.items, id: \.product) { item in
                
                OrderItemListView(orderItem: item)
                
            }
            
            
        }
//        .navigationTitle("Новый заказ 22")
        
    }
}

#Preview {
    let model = CreateOrderModel(order: Order.preview)
    return CreateOrderView()
        .environmentObject(model)
}
