//
//  ClientOrderListView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import SwiftUI

struct ClientOrderListView: View {
    
    @StateObject var model = ClientOrderListModel()
    
    var body: some View {
        
        NavigationStack {
            
            List {
                
                ForEach(model.orders, id: \.id) { order in
                    
                    NavigationLink {
                        ClientOrderDetailView(model: ClientOrderDetailModel(order: order))
                    } label: {
                        ClientOrderListRow(order: order)
                    }

                }
                
            }
            .navigationTitle("Мои Заказы")

        }
        
    }
    
}

#Preview {
    
    let model = ClientOrderListModel(orders: [Order.preview])
    
    return ClientOrderListView(model: model)
    
}
