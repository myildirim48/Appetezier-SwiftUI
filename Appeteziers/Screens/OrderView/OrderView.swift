//
//  OrderView.swift
//  Appeteziers
//
//  Created by YILDIRIM on 28.03.2023.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockAppetezierData.orderItems
    
    var body: some View {
            NavigationView {
                ZStack {
                    VStack {
                        List{
                            ForEach(orderItems) { order in
                                AppetezierListCell(appetezier: order)
                            }
                            .onDelete(perform: deleItems)
                        }
                        .listStyle(.plain)
                        .navigationTitle("🧾 Orders")
                        Button {
                            print("Action")
                        } label: {
                            APButton(title: "$9.99 - Place Order")
                        }
                        .padding(.bottom,20)
                    }
                    
                    if orderItems.isEmpty {
                        EmptyStateView(imageName: "empty-state-image", message: "You have no items in your order.\no Please add an appetezier.")
                    }
                }
            }
            .navigationViewStyle(.stack)
    }
    
    func deleItems(at offsets: IndexSet){
        orderItems.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
