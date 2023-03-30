//
//  ContentView.swift
//  Appeteziers
//
//  Created by YILDIRIM on 28.03.2023.
//

import SwiftUI

struct AppetezierTabView: View {
    
    @EnvironmentObject var order : Order
    
    var body: some View {
        TabView {
            AppetezierListView()
                .tabItem { Label("Home", systemImage:"house") }
            AccountView()
                .tabItem { Label("Account", systemImage:"person") }
            OrderView()
                .tabItem { Label("Order", systemImage:"bag") }
                .badge(order.items.count)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetezierTabView()
    }
}
