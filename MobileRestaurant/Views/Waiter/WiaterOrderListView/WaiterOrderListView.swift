//
//  WaiterOrderListView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct WaiterOrderListView: View {
    
    @StateObject var model: WaiterOrderListModel
    
    var body: some View {
        
        NavigationStack {
            
            List {
                
                ForEach(model.orders, id: \.id) { order in
                    
                    NavigationLink {
                        WaiterOrderDetailView(model: WaiterOrderDetailModel(order: order))
                    } label: {
                        WaiterOrderListRow(order: order)
                    }

                    
                }
                
            }
            .navigationTitle("Заказы")
            
            
        }
        
        
    }
}

#Preview {
    WaiterOrderListView(model: WaiterOrderListModel(waiter: Waiter.preview, orders: [Order.preview]))
}
