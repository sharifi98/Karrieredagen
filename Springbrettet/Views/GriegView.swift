//
//  GriegView.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import SwiftUI

struct GriegView: View {
    @State private var scale: CGFloat = 1.0
    @State private var previousScale: CGFloat = 1.0
    @State private var isZoomed = false
    @State private var offset = CGSize.zero
    @State private var previousOffset = CGSize.zero
    @State private var imageSize: CGSize = CGSize.zero

    var body: some View {
        GeometryReader { geometry in
            Image("stand")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(scale)
                .offset(offset) // Apply the offset to the image
                .onAppear {
                    imageSize = geometry.size
                }
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            let delta = value / previousScale
                            previousScale = value
                            scale *= delta

                            let minimumScale: CGFloat = 0.5
                            let maximumScale: CGFloat = 3.0
                            scale = min(max(scale, minimumScale), maximumScale)
                        }
                        .onEnded { value in
                            previousScale = 1.0
                        }
                )
                .simultaneousGesture(
                    DragGesture()
                        .onChanged { value in
                            if scale > 1.0 {
                                let scaledSize = CGSize(width: imageSize.width * scale, height: imageSize.height * scale)
                                offset.width = previousOffset.width + value.translation.width
                                offset.height = previousOffset.height + value.translation.height
                                
                                offset.width = min(max(offset.width, -scaledSize.width / 2 + imageSize.width / 2), scaledSize.width / 2 - imageSize.width / 2)
                                offset.height = min(max(offset.height, -scaledSize.height / 2 + imageSize.height / 2), scaledSize.height / 2 - imageSize.height / 2)
                            }
                        }
                        .onEnded { value in
                            previousOffset = offset
                        }
                )
                .gesture(
                    TapGesture(count: 2)
                        .onEnded {
                            withAnimation {
                                isZoomed = false
                                scale = 1.0
                                offset = .zero
                            }
                        }
                )
                .ignoresSafeArea()
        }
    }
}

struct GriegView_Previews: PreviewProvider {
    static var previews: some View {
        GriegView()
    }
}
