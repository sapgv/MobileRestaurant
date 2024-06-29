//
//  MainView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var model: ClientMenuOrderModel = ClientMenuOrderModel()
    
    var body: some View {
        
        TabView {
            
            ClientMenuListView()
                .tabItem { Label("Меню", systemImage: "menucard") }
                .environmentObject(model)
            
            ClientOrderListView()
                .tabItem { Label("Заказы", systemImage: "fork.knife") }
            
            ShiftListView(model: ShiftListViewModel())
                .tabItem { Label("Смены", systemImage: "person.badge.clock") }
            
        }
        
    }
}

#Preview {
    MainView()
}
