//
//  OrdersListView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import SwiftUI

struct OrdersListView: View {
    
    @StateObject var model = OrdersListModel()
    
    @State private var showMenu: Bool = false
    
    var body: some View {
        
        NavigationStack {
            
            List {
                
                ForEach(model.orders, id: \.id) { order in
                    
                    Section {
                        
                        ForEach(order.items, id: \.product) { item in
                            
                            OrderItemListView(orderItem: item)
                            
                        }
                        
                    } header: {
                        
                        HStack {
                            Text("Заказ")
                            Spacer()
                            Text(order.date.formatted(date: .abbreviated, time: .omitted))
                        }
                        
                    }
                    .headerProminence(.increased)
                    
                }
                
                
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        self.showMenu = true
                    }) {
                        Text("Новый заказ")
                    }
                    .tint(.blue)
                    .buttonStyle(.borderedProminent)
                }
            })
            .navigationTitle("Мои Заказы")
            .sheet(isPresented: $showMenu, content: {
                OrderView { order in
                    self.model.add(order: order)
                }
            })
            
        }
        
    }
    
}

#Preview {
    
    let item = OrderItem(product: Product.preview, count: 3)
    
    let order = Order(items: [item])
    
    let model = OrdersListModel(orders: [order])
    
    return OrdersListView(model: model)
    
}
