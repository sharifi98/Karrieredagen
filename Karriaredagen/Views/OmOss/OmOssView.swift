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
                NavigationLink(destination: KarrieredagenInformationView()) {
                    Label {
                        Text("Karrieredagen")
                    } icon: {
                        Image(systemName: "network")
                            .foregroundColor(.blue)
                    }
                    
                }
                
                NavigationLink(destination: SpringbrettfondetView()) {

                    Label {
                        Text("Springbrettfondet")
                    } icon: {
                        Image(systemName: "chart.line.uptrend.xyaxis")
                            .foregroundColor(.green)
                    }
                    
                }
                
                NavigationLink(destination: ProsjekterView()) {
                    
                    Label {
                        Text("Prosjekter")
                    } icon: {
                        Image(systemName: "hammer")
                            .foregroundColor(.purple)
                    }
                }
                
                NavigationLink(destination: HvemErSpringbrettetView()) {
                    
                    Label {
                        Text("Om Oss")
                    } icon: {
                        Image(systemName: "info.circle")
                            .foregroundColor(.gray)
                    }

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

