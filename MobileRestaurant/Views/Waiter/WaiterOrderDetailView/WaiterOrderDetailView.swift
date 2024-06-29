//
//  WaiterOrderDetailView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct WaiterOrderDetailView: View {
    
    @StateObject var model: WaiterOrderDetailModel
    
    @State private var currentStatus: OrderStatus?
    
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
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Button(action: {
                        self.currentStatus = model.order.status
                        
                    }, label: {
                        Text("Изменить статус заказа")
                    })
                    
                    
                }
            })
            .sheet(item: $currentStatus) { status in
                OrderStatusListView(action: { newStatus in
                    self.model.update(status: newStatus)
                }, currentStatus: status)
            }
            
        }
        
    }
    
}

#Preview {
    WaiterOrderDetailView(model: WaiterOrderDetailModel(order: Order.preview))
}
