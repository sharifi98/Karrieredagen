//
//  GifImage.swift
//  Karrieredagen
//
//  Created by Hossein Sharifi on 24/06/2023.
//

import SwiftUI
import WebKit

// GifImage is a struct that can host a UIKit WKWebView within a SwiftUI view hierarchy.
// It is used to display a GIF image, loaded from a file with a given name.
struct GifImage: UIViewRepresentable {
    private let name: String

    init(_ name: String) {
        self.name = name
    }

    // Create and configure a WKWebView to display a GIF image
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        if let url = Bundle.main.url(forResource: name, withExtension: "gif"),
           let data = try? Data(contentsOf: url) {
            webView.load(
                data,
                mimeType: "image/gif",
                characterEncodingName: "UTF-8",
                baseURL: url.deletingLastPathComponent()
            )
            webView.scrollView.isScrollEnabled = false
        }

        return webView
    }

    // Reload the view when it updates
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
}

struct GifImage_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            GifImage("kd24")
        }
    }
}
