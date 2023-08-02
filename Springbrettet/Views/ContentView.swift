import SwiftUI


struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.black.withAlphaComponent(0.9)
        if #available(iOS 15, *) {
            UITabBar.appearance().unselectedItemTintColor = UIColor.white
        }
    }

    
    var body: some View {
        TabView {
            HomeView()
                .background(Color.black) // Set the background color here
                .tabItem {
                    Label("Karrieredagen", systemImage: "graduationcap")
                }
            /*
             
            CVTipsView()
                .background(Color.blue)
                .tabItem {
                    Label("CV tips", systemImage: "text.quote")
                }
            
            */
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
        //.accentColor(Color("KDOrange")) // Set the tab item's text and icon color
        .accentColor(Color("KDOrange")) // Set the tab item's text and icon color
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
