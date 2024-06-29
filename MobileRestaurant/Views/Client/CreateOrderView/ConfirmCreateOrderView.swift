//
//  ConfirmCreateOrderView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct ConfirmCreateOrderView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var model: CreateOrderModel
    
    @EnvironmentObject var orderModel: ClientMenuOrderModel
    
    @Binding var showCreateOrder: Bool
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            List {
                
                Section {
                    
                    VStack {
                     
                        HStack {
                            Spacer()
                            Text(model.date.formatted(date: .complete, time: .omitted))
                                .foregroundStyle(.secondary)
                        }
                        
                        HStack(alignment: .center) {
                            Spacer()
                            Text("\(model.value) р")
                                .font(.title)
                            
                        }
                        
                    }
                    
                }
                
                
                
                Section {
                    
                    if let orderType = model.orderType {
                        
                        LabeledContent("Тип заказа", value: orderType.rawValue)
                        
                        
                    }
                    
                    if model.orderType == .restaurant, let desk = model.desk {
                        
                        LabeledContent("Стол", value: desk.name)
                        
                    }
                    
                    if let orderPayType = model.orderPayType {
                        
                        LabeledContent("Оплата", value: orderPayType.rawValue)
                        
                    }
                    
                } header: {
                    Text("Подробно")
                }
                
            }
            
            BottomActionView {
                self.model.createOrder()
                self.orderModel.reset()
                self.showCreateOrder = false
                
            } content: {
                
                Text("Оформить заказ")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(uiColor: .white.withAlphaComponent(0.5)))
                    .frame(maxWidth: .infinity)
                
                .padding()
                .background {
                    Color.green
                }
                
            }
            
        }
        .navigationTitle("Заказ")
        
    }
}

#Preview {
    let model = CreateOrderModel(orderType: .restaurant, desk: Desk.preview, items: OrderItem.arrayPreview)
    return ConfirmCreateOrderView(showCreateOrder: .constant(false))
        .environmentObject(model)
}
