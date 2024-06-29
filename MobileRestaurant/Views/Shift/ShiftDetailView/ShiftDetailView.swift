//
//  ShiftDetailView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct ShiftDetailView: View {
    
    @StateObject var model: ShiftDetailViewModel
    
    @StateObject var deskListModel: DeskListModel = DeskListModel()
    
    var body: some View {
        
        List {
            
            Section {
                LabeledContent("Дата", value: model.shift.date.formatted(date: .abbreviated, time: .omitted))
            }
            
            ForEach(deskListModel.list, id: \.self) { desk in
                
                VStack {
                    
                    HStack {
                        
                        LabeledContent(desk.name, value: "\(desk.places) мест")
                        
                    }
                    
                    if let waiter = model.shift.data[desk] {
                        
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
                
            }
            
            
        }
        .navigationTitle("Смена")
        
        
    }
}

#Preview {
    ShiftDetailView(model: ShiftDetailViewModel(shift: Shift.preview))
}
