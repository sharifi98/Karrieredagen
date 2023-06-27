//
//  FlatGlassView.swift
//  Karrieredagen
//
//  Created by Hossein Sharifi on 28/06/2023.
//

import SwiftUI

struct FlatGlassView : ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .padding()
                .frame(height: 50)
                .background(.ultraThinMaterial)
                .cornerRadius(14)
        } else {
            // Fallback on earlier versions
            content
                .padding()
                .frame(height: 50)
                .background(Color.gray) // Some other color for iOS versions earlier than 15.0
                .cornerRadius(14)
        }
    }
}

struct FlatGlassDemoView: View {
    var body: some View {
        Text("Hello, SwiftUI!")
            .modifier(FlatGlassView())
    }
}

struct FlatGlassView_Previews: PreviewProvider {
    static var previews: some View {
        FlatGlassDemoView()
    }
}
