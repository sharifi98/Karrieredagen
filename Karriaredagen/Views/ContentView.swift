import SwiftUI



struct ContentView: View {
    
    
    
    var body: some View {
        
        TabView {
            KDView()
                .tabItem {
                    Label("KD", systemImage: "graduationcap")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color("KDBlue"), for: .tabBar)
                
                
            ScheduleList()
                .tabItem {
                    Label("Timeplan", systemImage: "calendar")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color("KDBlue"), for: .tabBar)
                
            GriegView()
                .tabItem {
                    Label("Kart", systemImage: "map")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color("KDBlue"), for: .tabBar)
              
            OmOssView()
                .tabItem {
                    Label("Om oss", systemImage: "ellipsis.circle")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color("KDBlue"), for: .tabBar)
        }
        .accentColor(.orange) // Set the tab item's text and icon color
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
