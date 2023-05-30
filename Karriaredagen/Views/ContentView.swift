//
//  ContentView.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 29/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ScheduleList()
                .tabItem {
                    Label("Timeplan", systemImage: "calendar")
                }
            CompanyList()
                .tabItem {
                    Label("Bedrifter", systemImage: "briefcase")
                }
            GriegView()
                .tabItem {
                    Label("Kart", systemImage: "map")
                }
            Text("Bilder")
                .tabItem {
                    Label("Bilder", systemImage: "photo.artframe")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
