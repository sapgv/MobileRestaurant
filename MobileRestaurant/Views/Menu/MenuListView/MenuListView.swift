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
    
    @State private var showSelectDesk = false
    
    @State private var showCreateOrder = false
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 0) {
                
                List {
                    
                    Section {
                        
                        Button(action: {
                            
                            showSelectDesk = true
                            
                        }, label: {
                            if let desk = orderModel.desk {
                                
                                HStack {
                                    DeskCircleView(name: desk.name)
                                    Text("\(desk.places) мест")
                                }
                                
                            }
                            else {
                                Text("Выбрать стол")
                            }
                        })
                        
                    }
                    
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
                            self.showCreateOrder = true
                        }
                    )
                    
                }
                
            }
            .navigationTitle("Меню")
            .sheet(isPresented: self.$showSelectDesk, content: {
                DeskListView(selectedDesk: self.$orderModel.desk)
            })
//            .sheet(isPresented: self.$showCreateOrder, content: {
//                CreateOrderTabView(model: CreateOrderModel(order: self.orderModel.order))
//            })
            .fullScreenCover(isPresented: $showCreateOrder, content: {
                CreateOrderTabView(model: CreateOrderModel(order: self.orderModel.order))
                    })
        }
        
    }
    
}

#Preview {
    let model = OrderModel(order: Order.preview, desk: Desk.preview)
    return MenuListView()
        .environmentObject(model)
}
