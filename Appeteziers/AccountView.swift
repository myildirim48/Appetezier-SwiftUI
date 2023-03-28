//
//  AccountView.swift
//  Appeteziers
//
//  Created by YILDIRIM on 28.03.2023.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            Text("Account")
                .navigationTitle("👨🏼‍💼Account")
        }
        .navigationViewStyle(.stack)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
