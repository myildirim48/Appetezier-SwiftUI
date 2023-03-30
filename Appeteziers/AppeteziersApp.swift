//
//  AppeteziersApp.swift
//  Appeteziers
//
//  Created by YILDIRIM on 28.03.2023.
//

import SwiftUI

@main
struct AppeteziersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetezierTabView().environmentObject(order)
        }
    }
}

