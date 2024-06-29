//
//  ClientMenuListView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import SwiftUI

struct ClientMenuListView: View {
    
    @EnvironmentObject var model: ClientMenuOrderModel
    
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
                            if let desk = model.desk {
                                
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
                                                self.model.add(product: product)
                                                
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
                
                if !self.model.items.isEmpty {
                
                    BottomOrderView(
                        value: self.model.value,
                        action: {
                            self.showCreateOrder = true
                        }
                    )
                    
                }
                
            }
            .navigationTitle("Меню")
            .sheet(isPresented: self.$showSelectDesk, content: {
                DeskListView(selectedDesk: self.$model.desk)
            })
            .sheet(isPresented: self.$showCreateOrder, content: {
                CreateOrderView()
                    .environmentObject(CreateOrderModel(items: self.model.items))
                    .environmentObject(model)
            })
        }
        
    }
    
}

#Preview {
    let model = ClientMenuOrderModel(desk: Desk.preview)
    return ClientMenuListView()
        .environmentObject(model)
}
