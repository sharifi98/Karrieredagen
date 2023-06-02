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
            CompanyList()
                .tabItem {
                    Label("Bedrifter", systemImage: "briefcase")
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
