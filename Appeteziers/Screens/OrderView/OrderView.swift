//
//  OrderView.swift
//  Appeteziers
//
//  Created by YILDIRIM on 28.03.2023.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
            NavigationView {
                ZStack {
                    VStack {
                        List{
                            ForEach(order.items) { order in
                                AppetezierListCell(appetezier: order)
                            }
                            
                            .onDelete(perform: order.deleItems)
                        }
                        
                        .listStyle(.plain)
                        .navigationTitle("🧾 Orders")
                        Button {
                            print("Action")
                        } label: {
//                            APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                            Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                        }
                        .modifier(StandartButtonStyle())
                        .padding(.bottom,20)
                    }
                    
                    if order.items.isEmpty {
                        EmptyStateView(imageName: "empty-state-image", message: "You have no items in your order.\no Please add an appetezier.")
                    }
                }
            }
            .navigationViewStyle(.stack)
    }

}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
