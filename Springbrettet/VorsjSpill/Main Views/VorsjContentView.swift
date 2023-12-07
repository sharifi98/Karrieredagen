//
//  VorsjContentView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 07/12/2023.
//

import SwiftUI

struct VorsjContentView: View {
    enum ViewChoice {
        case viewMedDrikke
        case ViewUtenDrikke
    }
    
    @State private var vorsjShowWelcomeSheet = false
    @State private var selectedView : ViewChoice = .viewMedDrikke
    
    var body: some View {
        NavigationStack {
            
            VStack {
                Picker("Velg type lek", selection: $selectedView) {
                    Text("Med drikke").tag(ViewChoice.viewMedDrikke)
                    Text("Uten drikke").tag(ViewChoice.ViewUtenDrikke)
                }
                
            }
            .pickerStyle(.menu)
            Group {
                switch selectedView {
                case .viewMedDrikke:
                    MedDrikkeView()
                case .ViewUtenDrikke:
                    UtenDrikkeView()
                }
            }
            
        }
        .onAppear {
            if UserDefaults.standard.object(forKey: "VSappOpenedBefore") == nil {
                vorsjShowWelcomeSheet = true
            }
        }
        .sheet(isPresented: $vorsjShowWelcomeSheet) {
            VorsjWelcomeSheet(onDismiss: {
                UserDefaults.standard.set(true, forKey: "VSappOpenedBefore")
                vorsjShowWelcomeSheet = false
            })
        }
        
    }
}

struct Item: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let destinationView: AnyView
    let image: Image
}



struct ExtractedView<Destination: View>: View {
    let destination: Destination
    let title: String
    let color: Color
    
    init(destination: Destination, title: String, color: Color) {
        self.destination = destination
        self.title = title
        self.color = color
    }
    
    var body: some View {
        VStack {
            NavigationLink(destination: destination) {
                Text(title)
            }
        }
        .font(.title)
        .padding()
        .frame(minWidth: 100, maxWidth: 300, minHeight: 50, maxHeight: .infinity)
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .foregroundColor(.white)
        
    }
}

#Preview {
    VorsjContentView()
}
