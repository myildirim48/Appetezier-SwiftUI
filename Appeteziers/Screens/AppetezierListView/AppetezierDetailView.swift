//
//  AppetezierDetailView.swift
//  Appeteziers
//
//  Created by YILDIRIM on 29.03.2023.
//

import SwiftUI

struct AppetezierDetailView: View {
    
    @EnvironmentObject var order: Order
    
    @Binding var isShowingDetail: Bool
    let appetezier : AppetezierModel
    
    var body: some View {
        VStack {
            AppetezierRemoteImage(urlString: appetezier.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(appetezier.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top,20)
                
                Text(appetezier.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 45) {
                    NutritionInfo(title: "Calories", value: appetezier.calories)
                    NutritionInfo(title: "Carbs", value: appetezier.carbs)
                    NutritionInfo(title: "Protein", value: appetezier.protein)
                }
            }
            
            Spacer()
            
            Button {
                order.add(appetezier)
                isShowingDetail = false
            } label: {
                //                APButton(title: "$\(appetezier.price, specifier: "%.2f") - Add to Order")
                Text("$\(appetezier.price, specifier: "%.2f") - Add to Order")
                
            }
            .modifier(StandartButtonStyle())
                .padding(.bottom,30)
            
        }.frame(width: 300, height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(Button(action: {
                isShowingDetail = false
            }, label: {
                XDismissButton()
            }),alignment: .topTrailing)
    }
}

struct AppetezierDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetezierDetailView(isShowingDetail: .constant(true), appetezier: MockAppetezierData.sampleAppetezier)
    }
}

struct NutritionInfo: View {
    
    let title : String
    let value : Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
            
        }
    }
}
