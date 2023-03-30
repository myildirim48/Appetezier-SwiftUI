//
//  AppetezierCell.swift
//  Appeteziers
//
//  Created by YILDIRIM on 28.03.2023.
//

import SwiftUI


struct AppetezierListCell: View {
    
    var appetezier: AppetezierModel
    
    var body: some View {
        HStack {
//            AppetezierRemoteImage(urlString: appetezier.imageURL)
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 120, height: 90)
//                .cornerRadius(8)
//
            AsyncImage(url: URL(string: appetezier.imageURL), scale: 200) { img in
                img
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            } placeholder: {
                Image("placeholder-food")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            }

            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetezier.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetezier.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                
            }
        }
    }
}

struct AppetezierCel_Previews: PreviewProvider {
    static var previews: some View {
        AppetezierListCell(appetezier: MockAppetezierData.sampleAppetezier)
    }
}
