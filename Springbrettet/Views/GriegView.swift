//
//  GriegView.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import SwiftUI

struct GriegView: View {
    @GestureState private var magnifyBy = CGFloat(1.0)

    var body: some View {
        Image("stand")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaleEffect(magnifyBy)
            .gesture(MagnificationGesture().updating($magnifyBy) { currentState, gestureState, transaction in
                gestureState = currentState
            })
            .ignoresSafeArea()
    }
}

struct GriegView_Previews: PreviewProvider {
    static var previews: some View {
        GriegView()
    }
}
