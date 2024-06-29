//
//  MenuListView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import SwiftUI

struct MenuListView: View {
    
    @StateObject private var model = MenuModel()
    
    @EnvironmentObject var orderModel: OrderModel
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 0) {
                
                List {
                    
                    ForEach(model.list, id: \.name) { category in
                        
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
                
                if !self.orderModel.order.items.isEmpty {
                
                    BottomOrderView(
                        itemCount: self.orderModel.order.items.count,
                        value: self.orderModel.order.value,
                        action: {
                        }
                    )
                    
                }
                
            }
            .navigationTitle("Меню")
            
        }
        
    }
    
}

#Preview {
    MenuListView()
        .environmentObject(OrderModel(order: Order.preview))
}
