import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.black.withAlphaComponent(0.1)
    }
    
    var body: some View {
        TabView {
            KDView()
                .background(Color.black) // Set the background color here
                .tabItem {
                    Label("KD", systemImage: "graduationcap")
                }
/*
            ScheduleList()
                .background(Color.black) // Set the background color here
                .tabItem {
                    Label("Timeplan", systemImage: "calendar")
                }

            GriegView()
                .background(Color.black) // Set the background color here
                .tabItem {
                    Label("Kart", systemImage: "map")
                }
 */
            OmOssView()
                .background(Color.black) // Set the background color here
                .tabItem {
                    Label("Om oss", systemImage: "ellipsis.circle")
                }

        }
        .accentColor(.orange) // Set the tab item's text and icon color
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
