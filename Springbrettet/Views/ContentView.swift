import SwiftUI


struct ContentView: View {
    
    @State private var showWelcomeSheet = false
    
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
        .accentColor(Color.orange)
        .onAppear {
            if UserDefaults.standard.object(forKey: "appOpenedBefore") == nil {
                showWelcomeSheet = true
            }
        }
        .sheet(isPresented: $showWelcomeSheet) {
            WelcomeSheet(onDismiss: {
                UserDefaults.standard.set(true, forKey: "appOpenedBefore")
                showWelcomeSheet = false
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
