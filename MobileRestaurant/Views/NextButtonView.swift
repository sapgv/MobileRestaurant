//
//  NextButtonView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct NextButtonView: View {
    
    var action: (() -> Void)? = nil
    
    var title: String = "Далее"
    
    var body: some View {
        Button {
            action?()
        } label: {
            Text(title)
                .frame(maxWidth: .infinity)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(Color(uiColor: .white.withAlphaComponent(0.8)))
                .padding()
                .background {
                    Color.blue
                }
        }
    }
}

#Preview {
    NextButtonView()
}
