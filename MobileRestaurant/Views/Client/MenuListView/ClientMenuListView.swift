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
    
    @EnvironmentObject private var currentShiftModel: CurrentShiftModel
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 0) {
                
                List {
                    
                    Section {
                        
                        VStack() {
                            
                            HStack {
                                Text("ЗАКАЗ")
                                Spacer()
                            }
                            
                            Picker("Заказ", selection: $model.orderType) {
                            
                                ForEach(OrderType.allCases, id: \.self) { orderType in
                                    Text(orderType.rawValue).tag(orderType)
                                }
                                
                            }
                            .pickerStyle(.segmented)
                            
                            if model.orderType == .restaurant, let desk = model.desk {
                                
                                HStack(alignment: .center) {
                                    
                                    if let waiter = currentShiftModel.currentShift.data[desk] {
                                        
                                        VStack(alignment: .leading, spacing: 8) {
                                            
//                                            LabeledContent(desk.name, value: desk.placeTitle)
                                            
                                            HStack {
                                                Text(desk.name)
                                                Text(desk.placeTitle)
                                                    .foregroundStyle(.secondary)
                                            }
                                            
                                            HStack {
                                                
                                                Image(waiter.image)
                                                    .resizable()
                                                    .frame(width: 44, height: 44)
                                                    .clipShape(Circle())
                                                
                                                VStack(alignment: .leading) {
                                                    
                                                    Text(waiter.name)
                                                    Text("Официант")
                                                        .foregroundStyle(.secondary)
                                                    
                                                }
                                                
                                                Spacer()
                                                
                                                Button(action: {
                                                    showSelectDesk = true
                                                }, label: {
                                                    Image(systemName: "chair.lounge")
                                                        .resizable()
                                                        .frame(width: 22, height: 22)
                                                })
                                                
                                            }
                                            
                                        }
                                        
                                    }
                                    
                                }
                                .padding(4)
                            }
                            
                        }
                        
                    } header: {
                        
                    }
                    .headerProminence(.increased)

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
            .sheet(isPresented: self.$showCreateOrder,
                   content: {
                CreateOrderView()
                    .environmentObject(CreateOrderModel(orderType: self.model.orderType, desk: self.model.desk, items: self.model.items))
                    .environmentObject(model)
            })
        }
        
    }
    
}

#Preview {
    let model = ClientMenuOrderModel(desk: Desk.preview)
    return ClientMenuListView()
        .environmentObject(model)
        .environmentObject(CurrentShiftModel())
}
