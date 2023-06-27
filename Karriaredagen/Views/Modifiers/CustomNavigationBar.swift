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
                Color("KDBlue"),
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }
}

extension View {
    func navigationBarWithOrangeBackground() -> some View {
        self.modifier(CustomNavigationBar())
    }
}

