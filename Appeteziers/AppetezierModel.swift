//
//  AppetezierModel.swift
//  Appeteziers
//
//  Created by YILDIRIM on 28.03.2023.
//

import Foundation
struct AppetezierModel: Decodable,Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetezierResponse:Decodable {
    let request: [AppetezierModel]
}

struct MockAppetezierData {
    static let sampleAppetezier = AppetezierModel(id: 001, name: "Test Appetezier",
                                                  description: "The description of the test appetezier. Its yummy.",
                                                  price: 9.31, imageURL: "", calories: 99, protein: 31, carbs: 123)
    
    static let appeteziers = [sampleAppetezier,sampleAppetezier,sampleAppetezier,sampleAppetezier]
}
