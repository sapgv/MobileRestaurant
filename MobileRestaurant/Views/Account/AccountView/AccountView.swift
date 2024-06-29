//
//  AccountView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var model = AccountViewModel()

    @State var isEditing = false
    
    @State var selection = Set<Order>()
    
//    @Environment(\.editMode) var editMode
    
    var body: some View {
        
        NavigationStack {
            
            List {
                
                ForEach(model.orders, id: \.id) { order in
                    
                    AccountOrderListView(order: order)
                    
                }
                
                
            }
//            .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
//            .environment(\.editMode, self.isEditing ? EditMode.active : EditMode.inactive)
            .toolbar {
                Button(action: {
                    self.isEditing.toggle()
//                    self.editMode = s
                }) {
                    Text(isEditing ? "Готово" : "Выбрать")
                        .frame(width: 80, height: 40)
                }
            }
            .navigationTitle("Заказы")
            
        }
        
    }
    
}

#Preview {
    AccountView()
}
