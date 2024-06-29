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
    
    @EnvironmentObject var currentShiftModel: CurrentShiftModel
    
    @Binding var selectedDesk: Desk?
    
    var body: some View {
        
        NavigationStack {
         
            List {
                
                ForEach(deskListModel.list, id: \.name) { desk in
                    
                    HStack {
                        
                        VStack {
                            
                            HStack {
                                
                                LabeledContent(desk.name, value: "\(desk.places) мест")
                                
                            }
                            
                            if let waiter = currentShiftModel.currentShift.data[desk] {
                                
                                HStack {
                                    
                                    Image(waiter.image)
                                        .resizable()
                                        .frame(width: 44, height: 44)
                                        .clipShape(Circle())
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text(waiter.name)
                                        Text("Официант")
                                            .foregroundStyle(.secondary)
                                        
                                    }
                                    
                                    Spacer()
                                    
                                }
                                
                            }
                            
                        }
                        
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
        .environmentObject(CurrentShiftModel())
}
