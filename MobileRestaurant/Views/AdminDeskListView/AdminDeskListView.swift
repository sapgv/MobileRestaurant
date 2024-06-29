//
//  AdminDeskListView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct AdminDeskListView: View {
    
    @StateObject var model = AdminDeskListModel()
    
    @State private var showFree = false
    
    private var list: [Desk] {
        self.showFree ? self.freeList : self.model.list
    }
    
    private var freeList: [Desk] {
        self.model.list.filter { $0.free }
    }
    
    var body: some View {
        
        NavigationStack {
         
            List {
                
                Section {
                    
                    Toggle(isOn: $showFree) { Text("Показать свободные") }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        if !freeList.isEmpty {
                            Text("\(freeList.count) столик(а) свободно")
                        }
                        
                        Text("Среднее время ожидания столика 15 мин.")
                            .foregroundStyle(.secondary)
                        
                    }
                    
                    
                }
                
                Section {
                    
                    ForEach(list, id: \.name) { desk in
                        
                        HStack {
                            
                            LabeledContent(desk.name, value: "\(desk.places) мест")
                            
                            Spacer()
                            
                            Circle()
                                .fill(desk.free ? Color.green : Color.red)
                                .frame(width: 8, height: 8)
                            
                        }
                        
                    }
                    
                }
                
            }
            
            .navigationTitle("Столы")
            
            
        }
        
        
    }
    
}

#Preview {
    AdminDeskListView()
}
