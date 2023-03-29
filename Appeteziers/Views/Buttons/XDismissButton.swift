//
//  XDismissButton.swift
//  Appeteziers
//
//  Created by YILDIRIM on 29.03.2023.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 35, height: 35)
                .foregroundColor(.white)
                .opacity(0.6)
                .padding()
                .shadow(color: .secondary, radius: 10)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.secondary)
                .shadow(color: .black, radius: 4)
                
        }
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton()
    }
}
