//
//  CustomModifiers.swift
//  Appeteziers
//
//  Created by YILDIRIM on 30.03.2023.
//

import SwiftUI

struct StandartButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
            content
                .buttonStyle(.bordered)
                .tint(.accentColor)
                .controlSize(.large)
    }
}
