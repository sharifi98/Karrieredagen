import SwiftUI



struct ContentView: View {
    var body: some View {
        TabView {
            KDView()
                .tabItem {
                    Label("KD", systemImage: "graduationcap")
                }
            ScheduleList()
                .tabItem {
                    Label("Timeplan", systemImage: "calendar")
                }
            GriegView()
                .tabItem {
                    Label("Kart", systemImage: "map")
                }
            OmOssView()
                .tabItem {
                    Label("Om oss", systemImage: "ellipsis.circle")
                }
        }
        .ignoresSafeArea()
        .tabViewStyle(DefaultTabViewStyle()) // Apply a custom tab view style
        .accentColor(.orange) // Set the tab item's text and icon color
        .shadow(color: .gray, radius: 10, x: 0, y: 5) // Add a shadow
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
