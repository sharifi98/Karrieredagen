//
//  KarriaredagenApp.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 29/05/2023.
//

import SwiftUI

@main
struct KarrieredagenApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .environmentObject(modelData)
                
        }
    }
}
