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
                .tabItem { Label("Заказы клиента", systemImage: "fork.knife") }
            
            WaiterOrderListView(model: WaiterOrderListModel(waiter: .preview))
                .tabItem { Label("Заказы официанта", systemImage: "fork.knife.circle.fill") }
            
            ShiftListView(model: ShiftListViewModel())
                .tabItem { Label("Смены", systemImage: "person.badge.clock") }
            
            AdminDeskListView()
                .tabItem { Label("Админ", systemImage: "person") }
            
            
        }
        
    }
}

#Preview {
    MainView()
}
