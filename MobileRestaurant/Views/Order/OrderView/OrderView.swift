//
//  OrderView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import SwiftUI

struct OrderView: View {

    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var orderModel: OrderModel
    
    @StateObject var menuModel: MenuModel = MenuModel()
    
    var completeOrder: ((Order) -> Void)? = nil
    
    var body: some View {
       
        NavigationStack {
            
            VStack(spacing: 0) {
                
                List {
                    
                    ForEach(menuModel.list, id: \.name) { category in
                        
                        Section {
                            
                            ForEach(category.products, id: \.name) { product in
                                
                                NavigationLink(value: Coordinator.MenuList.product(product)) {
                                    
                                    ProductListView(product: product)
                                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                            Button {
                                                self.orderModel.add(product: product)
                                                
                                            } label: {
                                                Text("Добавить")
                                            }
                                            .tint(.green)
                                        }
                                }
                                
                                
                            }
                            
                        } header: {
                            Text(category.name)
                        }
                        .headerProminence(.increased)
                        
                    }
                    
                }

                BottomOrderView(
                    value: self.orderModel.order.value,
                    action: {
                        completeOrder?(self.orderModel.order)
                        dismiss()
                    }
                )
                
            }
            .navigationTitle("Новый заказ")
            
        }
        
    }
}

#Preview {
    return OrderView()
        .environmentObject(OrderModel(order: Order.preview))
}
