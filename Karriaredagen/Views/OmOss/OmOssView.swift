//
//  OmOssView.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 24/06/2023.
//

import SwiftUI

struct OmOssView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: KarrieredagenView()) {
                    Label("Karrieredagen", systemImage: "network")
                    
                }
                
                NavigationLink(destination: SpringbrettfondetView()) {
                    Label("Springbrettfondet", systemImage: "chart.line.uptrend.xyaxis")
                }
                
                NavigationLink(destination: ProsjekterView()) {
                    Label("Prosjekter", systemImage: "hammer")
                }
                
                NavigationLink(destination: HvemErSpringbrettetView()) {
                    Label("Om oss", systemImage: "info.circle")
                }
            }
            .foregroundColor(.orange)
            //.navigationTitle("Om Oss")
            .listStyle(.grouped)
        }
    }
}

struct KarrieredagenView: View {
    var body: some View {
        Text("Karrieredagen View")
    }
}

struct SpringbrettfondetView: View {
    var body: some View {
        Text("Springbrettfondet View")
    }
}

struct ProsjekterView: View {
    var body: some View {
        Text("Prosjekter View")
    }
}

struct OmOssDetailView: View {
    var body: some View {
        Text("Om Oss Detail View")
    }
}

struct OmOssView_Previews: PreviewProvider {
    static var previews: some View {
        OmOssView()
    }
}

