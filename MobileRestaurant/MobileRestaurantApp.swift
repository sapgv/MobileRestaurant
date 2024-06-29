//
//  MobileRestaurantApp.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 28.06.2024.
//

import SwiftUI

@main
struct MobileRestaurantApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject private var currentShiftModel = CurrentShiftModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(currentShiftModel)
        }
    }
}
