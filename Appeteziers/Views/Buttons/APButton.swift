//
//  APButton.swift
//  Appeteziers
//
//  Created by YILDIRIM on 29.03.2023.
//

import SwiftUI

struct APButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 250, height: 40)
            .background(Color.accentColor)
            .cornerRadius(10)
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "Button")
    }
}
