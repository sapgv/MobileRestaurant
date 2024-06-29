//
//  ClientOrderDetailView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct ClientOrderDetailView: View {
    
    @StateObject var model: ClientOrderDetailModel
    
    var body: some View {
       
        NavigationStack {
            
            List {
                
                Section {
                    
                    ForEach(model.order.items, id: \.product) { item in
                        
                        OrderItemListView(orderItem: item)
                        
                    }
                    
                    ClientOrderListPayView(order: model.order)
                    
                } header: {
                    
                    HStack {
                        HStack() {
                            Text("Заказ")
                            Text(model.order.status.rawValue)
                                .font(.caption)
                                .padding(4)
                                .background {
                                    Color(uiColor: model.order.status.color)
                                }
                                .foregroundStyle(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 3))
                            
                        }
                        Spacer()
                        Text(model.order.date.formatted(date: .abbreviated, time: .omitted))
                    }
                    
                }
                .headerProminence(.increased)
                
            }
            .navigationTitle(model.order.title)
            
        }
        
    }
}

#Preview {
    ClientOrderDetailView(model: ClientOrderDetailModel(order: Order.preview))
}
