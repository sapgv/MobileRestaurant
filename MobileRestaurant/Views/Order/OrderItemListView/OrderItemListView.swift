//
//  OrderItemListView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import SwiftUI

struct OrderItemListView: View {
    
    var orderItem: OrderItem
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            Image(orderItem.product.image)
                .resizable()
                .frame(width: 44, height: 44)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))

            VStack(alignment: .leading, spacing: 8) {
                
                Text(orderItem.product.name)
                
                Text(orderItem.product.netto)
                    .foregroundStyle(.secondary)
                    .font(.caption)
                
                Text(orderItem.product.description)
                    .foregroundStyle(.secondary)
                    .font(.caption)
            }
            
            Spacer()
            
            VStack(spacing: 8) {
                
                Text("\(orderItem.value) р")
                
                Text("\(orderItem.unit)")
                    .foregroundStyle(.secondary)
                    .font(.caption)
                
            }
            
        }
        
    }
}

#Preview {
    OrderItemListView(orderItem: OrderItem(product: Product.preview, count: 3))
}
