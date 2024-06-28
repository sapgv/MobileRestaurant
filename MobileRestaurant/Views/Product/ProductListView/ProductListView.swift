//
//  ProductListView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import SwiftUI

struct ProductListView: View {
    
    var product: Product
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            Image(product.image)
                .resizable()
                .frame(width: 44, height: 44)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))

            VStack(alignment: .leading, spacing: 8) {
                
                Text(product.name)
                
                Text(product.netto)
                    .foregroundStyle(.secondary)
                    .font(.caption)
                
                Text(product.description)
                    .foregroundStyle(.secondary)
                    .font(.caption)
            }
            
            Spacer()
            
            VStack(spacing: 8) {
                
                Text("\(product.price) р")
                
                Text("\(product.unit.title)")
                    .foregroundStyle(.secondary)
                    .font(.caption)
                
            }
            
        }
        
    }
}

#Preview {
    let product = Product(name: "Мидии белое вино, петрушка", price: 850, image: "1", netto: "450/30/70г")
    return ProductListView(product: product)
}
