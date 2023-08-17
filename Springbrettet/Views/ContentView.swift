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
                .background(Color.black)
                .tabItem {
                    Label("Karrieredagen", systemImage: "graduationcap")
                }
            
            OmOssView()
                .background(Color.black)
                .tabItem {
                    Label("Om oss", systemImage: "ellipsis.circle")
                }
        }
        .accentColor(Color("KDOrange"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
