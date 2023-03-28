//
//  OrderView.swift
//  Appeteziers
//
//  Created by YILDIRIM on 28.03.2023.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        
        NavigationView {
            Text("Orders")
                .navigationTitle("🧾 Orders")
        }
        .navigationViewStyle(.stack)

    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
