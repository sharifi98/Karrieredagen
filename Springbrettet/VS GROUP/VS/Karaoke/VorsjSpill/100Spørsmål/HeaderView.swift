//
//  HeaderView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 22/08/2023.
//

import SwiftUI
import Foundation

struct  HeaderView: View {
    @Binding var searchText: String
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            Text("Søker etter \(searchText)?")
                .searchable(text: $searchText)
                .navigationTitle("Vorsj-spill")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading: Button {
                        print("Pressed edit button")
                    } label: {
                        Text("Edit")
                    },
                    
                    trailing: Button {
                        showingSheet.toggle()
                        print("Pressed compose button")
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                        .sheet(isPresented: $showingSheet) {
                            SheetView()
                        }
                    
                )
        }
        .frame(height: 80)
    }
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Kontakt meg på mail eller instagram hvis du har nye drikkeleker eller andre forslag")
                .multilineTextAlignment(.center)
                .padding()
            
        }
        .presentationDetents([.medium, .large])
    }
}



