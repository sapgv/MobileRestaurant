//
//  AppDelegate.swift
//  MobileRestaurant
//
//  Created by Grigory Sapogov on 29.06.2024.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        Storage.shared.restore()
        
        return true
        
    }
    
}
