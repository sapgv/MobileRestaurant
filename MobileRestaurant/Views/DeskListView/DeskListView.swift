//
//  DeskListView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct DeskListView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var deskListModel = DeskListModel()
    
    @Binding var selectedDesk: Desk?
    
    var body: some View {
        
        NavigationStack {
         
            List {
                
                
                
                ForEach(deskListModel.list, id: \.name) { desk in
                    
                    HStack {
                        
                        DeskCircleView(name: desk.name)
                        
//                        Spacer()
                        
                        Text("\(desk.places) мест")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        if desk == selectedDesk {
                            Image(systemName: "checkmark")
                                .foregroundStyle(Color.blue)
                        }
                        
                        
                    }
                    
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.selectedDesk = desk
                        dismiss()
                    }
                }
                
                
            }
            
            .navigationTitle("Столы")
            
            
        }
        
        
    }
}

#Preview {
    DeskListView(selectedDesk: .constant(nil))
}
