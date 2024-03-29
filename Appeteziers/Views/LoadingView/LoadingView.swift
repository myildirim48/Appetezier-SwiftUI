//
//  LoadingView.swift
//  Appeteziers
//
//  Created by YILDIRIM on 28.03.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
                .scaleEffect(1.5)
            Text("Loading...")
                .font(.callout)
                .fontWeight(.light)
                .padding(.top, 70) 
            
        }
    }
}

struct LoadinView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
