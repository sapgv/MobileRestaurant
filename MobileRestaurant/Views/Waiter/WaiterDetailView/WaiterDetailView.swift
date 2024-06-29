//
//  WaiterDetailView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct WaiterDetailView: View {
    
    @StateObject var model: WaiterDetailViewModel
    
    var body: some View {
    
        NavigationStack {
            
            List {
                
                Section {
                    
                    HStack {
                        
                        Image(model.waiter.image)
                            .resizable()
                            .frame(width: 44, height: 44)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            
                            Text(model.waiter.name)
                            Text("Официант")
                                .foregroundStyle(.secondary)
                            
                        }
                        
                        Spacer()
                        
                        
                    }
                    
                    Button(action: {}, label: {
                        Text("Оставить отзыв")
                    })
                    
                    
                    
                }
                
            }
            .navigationTitle("Официант")
            
            
        }
        
        
    }
}

#Preview {
    WaiterDetailView(model: WaiterDetailViewModel(waiter: Waiter.preview))
}
