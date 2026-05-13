import SwiftUI
import WebKit

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List {
                HeroSection()
                CareerDaySection()
                SpringbrettProjectsSection()
                CallToActionSection()
                ContactInfoSection()
            }
            .listStyle(.insetGrouped)
            .navigationBarWithTransparentBackground()
            .toolbar {
                ToolbarItemGroup(placement: .principal) {
                    HStack {
                        NavigationLink(destination: VorsjContentView()) {
                            Image("SB")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 35)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .overlay(Rectangle().foregroundColor(.clear))
        }
    }
}

struct FeedBackView: View {
    var body: some View {
        WebView(request: URLRequest(url: URL(string: "https://docs.google.com/forms/d/1l-rudvgcFhys5A-a-FWjxz3VVlhSD4cIIfOEqk-2RSU/edit")!))
    }
}

struct SalmonCityView: View {
    var body: some View {
        WebView(request: URLRequest(url: URL(string: "https://www.salmoncity.no/")!))
    }
}

struct WebView: UIViewRepresentable {
    let request: URLRequest

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(request)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) { }
}

struct KDView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
