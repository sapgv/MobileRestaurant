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
                                
                                HStack(alignment: .center) {
                                    
                                    Image(product.image)
                                        .resizable()
                                        .frame(width: 44, height: 44)
                                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))

                                    VStack(alignment: .leading, spacing: 8) {
                                        
                                        Text(product.name)
                                        
                                        Text(product.netto)
                                            .foregroundStyle(.secondary)
                                            .font(.caption)
                                        
                                        Text(product.description)
                                            .foregroundStyle(.secondary)
                                            .font(.caption)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(spacing: 8) {
                                        
                                        Text("\(product.price) р")
                                        
                                        Text("\(product.unit.title)")
                                            .foregroundStyle(.secondary)
                                            .font(.caption)
                                        
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                    } header: {
                        Text(category.name)
                    }
                    .headerProminence(.increased)
                    
                }
                
                
            }
            .navigationTitle("Меню")
            .safeAreaInset(edge: .bottom) {
                BottomOrderView(itemCount: 3, value: 1200)
                    .padding()
                
                .background(.bar)
            }
            
        }
        
    }
    
}

#Preview {
    MenuListView()
}
