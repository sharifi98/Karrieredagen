//
//  CustomNavigationBar.swift
//  Karrieredagen
//
//  Created by Hossein Sharifi on 25/06/2023.
//

import SwiftUI

struct CustomNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .toolbarBackground(
                Color(red: Double(4) / 255.0, green: Double(20) / 255.0, blue: Double(28) / 255.0),
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }
}

extension View {
    func navigationBarWithOrangeBackground() -> some View {
        self.modifier(CustomNavigationBar())
    }
}

