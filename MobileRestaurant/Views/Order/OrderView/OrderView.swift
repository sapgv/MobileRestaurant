//
//  OrderView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import SwiftUI

struct OrderView: View {

    @Environment(\.dismiss) var dismiss
    
    @StateObject private var model = OrderViewModel()
    
    var completeOrder: ((Order) -> Void)? = nil
    
    var body: some View {
       
        NavigationStack {
            
            List {
                
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
            .navigationTitle("Новый заказ")
            .safeAreaInset(edge: .bottom) {
                if !self.model.order.items.isEmpty {
                    BottomOrderView(
                        itemCount: self.model.order.items.count,
                        value: self.model.order.value,
                        action: {
                            completeOrder?(self.model.order)
                            dismiss()
                        }
                    )
                    .padding()
                    .background(.bar)
                }
            }
            
        }
        
    }
}

#Preview {
    OrderView()
}
