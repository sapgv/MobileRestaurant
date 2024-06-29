//
//  MainView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var orderModel: OrderModel = OrderModel()
    
    var body: some View {
        
        TabView {
            
            MenuListView()
                .tabItem { Label("Меню", systemImage: "menucard") }
                .environmentObject(orderModel)
            
            OrdersListView()
                .tabItem { Label("Заказы", systemImage: "fork.knife") }
            
            AccountView()
                .tabItem { Label("Бухгалтер", systemImage: "tray.full") }
            
        }
        
    }
}

#Preview {
    MainView()
}
