//
//  OrdersListView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import SwiftUI

struct OrdersListView: View {
    
    @StateObject private var model = OrdersListModel()
    
    @State private var showMenu: Bool = false
    
    var body: some View {
        
        NavigationStack {
            
            List {
                
                ForEach(model.orders, id: \.id) { order in
                    
                    Section {
                        
                        ForEach(order.items, id: \.product.name) { item in
                            
                            HStack(alignment: .center) {
                                
                                Image(item.product.image)
                                    .resizable()
                                    .frame(width: 44, height: 44)
                                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))

                                VStack(alignment: .leading, spacing: 8) {
                                    
                                    Text(item.product.name)
                                    
                                    Text(item.product.netto)
                                        .foregroundStyle(.secondary)
                                        .font(.caption)
                                    
                                    Text(item.product.description)
                                        .foregroundStyle(.secondary)
                                        .font(.caption)
                                }
                                
                                Spacer()
                                
                                VStack(spacing: 8) {
                                    
                                    Text("\(item.product.price) р")
                                    
                                    Text("\(item.product.unit.title)")
                                        .foregroundStyle(.secondary)
                                        .font(.caption)
                                    
                                }
                                
                            }
                            
                        }
                        
                    } header: {
                        
                        Text(order.date.formatted(date: .abbreviated, time: .omitted))
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .headerProminence(.increased)
                    
                }
                
                
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        self.showMenu = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .padding(.horizontal)
                    }
                }
            })
            .navigationTitle("Мои Заказы")
            .sheet(isPresented: $showMenu, content: {
        
                MenuListView()
                
            })
            
        }
        
    }
    
}

#Preview {
    OrdersListView()
}
