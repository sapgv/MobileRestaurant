//
//  ShiftListView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct ShiftListView: View {
    
    @StateObject var model: ShiftListViewModel
    
    @State var newShift = false
    
    var body: some View {
        
        NavigationStack {
            
            List {
                
                ForEach(model.shifts, id: \.date) { shift in
                    
                    NavigationLink {
                        ShiftDetailView(model: ShiftDetailViewModel(shift: shift))
                    } label: {
                        LabeledContent("Смена", value: shift.date.formatted(date: .abbreviated, time: .omitted))
                    }
                    
                }
                
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
//                        self.newShift = true
                    }, label: {
                        Text("Новая смена")
                    })
                }
            })
            .navigationTitle("Смены")
            .navigationDestination(isPresented: $newShift) {
//                ShiftDetailView(model: ShiftDetailViewModel(shift: shift))
            }
            
        }
        
    }
}

#Preview {
    ShiftListView(model: ShiftListViewModel())
}
