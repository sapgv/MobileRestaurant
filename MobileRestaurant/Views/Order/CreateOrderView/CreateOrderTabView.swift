//
//  CreateOrderTabView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct CreateOrderTabView: View {
    
    @StateObject var model: CreateOrderModel
    
    var body: some View {
        
        NavigationStack {
            
            TabView {
                
//                CreateOrderView()
                List {
                    Text("sdfsdf")
                }
                    .tag(0)
                
//                CreateOrderView()
//                    .tag(1)
    //                .tabItem {
    //
    //                    Text("2")
    //                }
                    
                
            }
            
        }
       
        
        .navigationTitle("sdfsfd ")
        .environmentObject(model)
//        .tabViewStyle(.page)
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    let model = CreateOrderModel(order: Order.preview)
    return CreateOrderTabView(model: model)
}
