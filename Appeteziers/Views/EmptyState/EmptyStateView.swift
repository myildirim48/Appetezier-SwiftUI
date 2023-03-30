//
//  EmptyStateView.swift
//  Appeteziers
//
//  Created by YILDIRIM on 29.03.2023.
//

import SwiftUI

struct EmptyStateView: View {
    
    let imageName  : String
    let message : String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                
            }
            .offset(y:-50)
        }
        
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(imageName: "empty-state-image", message: "This is a text message for empty state view.")
    }
}
