//
//  KarriaredagenApp.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 29/05/2023.
//

import SwiftUI

@main
struct KarrieredagenApp: App {
    
    init() {
        // Apply the style to all navigation bars
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
