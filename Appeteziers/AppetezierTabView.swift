//
//  ContentView.swift
//  Appeteziers
//
//  Created by YILDIRIM on 28.03.2023.
//

import SwiftUI

struct AppetezierTabView: View {
    var body: some View {
        TabView {
            AppetezierListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                        
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetezierTabView()
    }
}
