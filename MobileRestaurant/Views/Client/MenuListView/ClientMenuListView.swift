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
    
    @State private var showWaiter: Waiter?
    
    @EnvironmentObject private var currentShiftModel: CurrentShiftModel
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 0) {
                
                List {
                    
                    Section {
                        
                        VStack {
                            
                            self.pickerView
                            
                            if model.orderType == .restaurant {
                                
                                HStack(alignment: .center) {
                                    
                                    if let desk = model.desk, let waiter = currentShiftModel.currentShift.data[desk] {
                                        self.waiterView(desk: desk, waiter: waiter)
                                        Spacer()
                                        self.showDeskView
                                    }
                                    else {
                                        self.showDeskView
                                        Spacer()
                                    }
                                    
                                    
                                    
                                    
                                    
                                    
                                }
                                .padding(4)
                            }
                            
                        }
                        
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
            .navigationTitle("Заказ")
            .sheet(isPresented: self.$showSelectDesk, content: {
                DeskListView(selectedDesk: self.$model.desk)
            })
            
            .sheet(item: $showWaiter, content: { waiter in
                WaiterDetailView(model: WaiterDetailViewModel(waiter: waiter))
            })
            .sheet(isPresented: self.$showCreateOrder,
                   content: {
                CreateOrderView()
                    .environmentObject(CreateOrderModel(orderType: self.model.orderType, desk: self.model.desk, items: self.model.items))
                    .environmentObject(model)
            })
        }
        
    }
    
    @ViewBuilder
    var pickerView: some View {
        Picker("Заказ", selection: $model.orderType) {
            ForEach(OrderType.allCases, id: \.self) { orderType in
                Text(orderType.rawValue).tag(orderType)
            }
        }
        .pickerStyle(.segmented)
    }
    
    func waiterView(desk: Desk, waiter: Waiter) -> some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
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
                    
                    Button(action: {
                        self.showWaiter = waiter
                        
                    }, label: {
                        Text(waiter.name)
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    Text("Официант")
                        .foregroundStyle(.secondary)
                    
                }
                
                Spacer()
                
                
            }
            
        }
        
    }
    
    @ViewBuilder
    var showDeskView: some View {
        
        Button(action: {
            showSelectDesk = true
        }, label: {
            Text("Выбрать стол")
        })
        .buttonStyle(BorderlessButtonStyle())
        
    }
    
}

#Preview {
    let model = ClientMenuOrderModel(desk: Desk.preview)
    return ClientMenuListView()
        .environmentObject(model)
        .environmentObject(CurrentShiftModel())
}
