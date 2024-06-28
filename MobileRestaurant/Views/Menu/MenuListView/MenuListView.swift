//
//  MenuListView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import SwiftUI

struct MenuListView: View {
    
    @StateObject private var model = MenuListModel()
    
    var body: some View {
        
        NavigationStack {
            
            List {
                
                ForEach(model.list, id: \.name) { category in
                    
                    Section {
                        
                        ForEach(category.products, id: \.name) { product in
                            
                            NavigationLink(value: Coordinator.MenuList.product(product)) {
                                
                                ProductListView(product: product)
                                
                            }
                            
                        }
                        
                    } header: {
                        Text(category.name)
                    }
                    .headerProminence(.increased)
                    
                }
                
                
            }
            .navigationTitle("Меню")
            
        }
        
    }
    
}

#Preview {
    MenuListView()
}
