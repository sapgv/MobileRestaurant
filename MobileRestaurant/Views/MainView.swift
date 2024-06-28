//
//  MainView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView {
            
            MenuListView()
                .tabItem { Label("Меню", systemImage: "menucard") }
            
            OrdersListView()
                .tabItem { Label("Заказы", systemImage: "fork.knife") }
            
        }
        
    }
}

#Preview {
    MainView()
}
