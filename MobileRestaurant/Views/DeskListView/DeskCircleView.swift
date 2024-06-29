//
//  DeskCircleView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct DeskCircleView: View {
    
    var name: String
    
    var body: some View {
        
        ZStack {
            Color(uiColor: .brown.withAlphaComponent(0.6))
            Text(name)
                .foregroundStyle(Color.white)
        }
        .frame(width: 44, height: 44)
        .clipShape(Circle())
        
    }
}

#Preview {
    DeskCircleView(name: "1")
}
