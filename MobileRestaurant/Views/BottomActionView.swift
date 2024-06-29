//
//  BootomActionView.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import SwiftUI

struct BottomActionView<Content: View>: View {
    
    let content: Content
    
    var action: (() -> Void)? = nil
    
    init(action: (() -> Void)? = nil, @ViewBuilder content: () -> Content) {
        self.action = action
        self.content = content()
    }
    
    var body: some View {
        
        Button(action: {
            
            action?()
            
        }, label: {
            
            content
            
        })
        
    }
}

#Preview {
    BottomActionView {
        Text("Действие")
    }
}
