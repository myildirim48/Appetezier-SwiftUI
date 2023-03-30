//
//  Order.swift
//  Appeteziers
//
//  Created by YILDIRIM on 29.03.2023.
//

import SwiftUI
final class Order: ObservableObject {
    
    @Published var items : [AppetezierModel] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetezier: AppetezierModel) {
        items.append(appetezier)
    }
    
    func deleItems(at offsets: IndexSet){
        items.remove(atOffsets: offsets)
    }
}
