//
//  GrieghallenView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 15/08/2023.
//

import SwiftUI

struct GrieghallenView: View {
    
    var floors = ["Kart", "Standnummer"]
    @State private var selectedFloor = "Kart"
    
    var body: some View {
        ZStack {
            VStack {
                Picker("Velg etasje", selection: $selectedFloor) {
                    ForEach(floors, id: \.self) {
                        Text("\($0)") 
                    }
                }
                .pickerStyle(.segmented)
                
                // Image view based on the selected floor
                Image(imageName(for: selectedFloor))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 600, height: 600)  // you can adjust this as needed
            }
        }
    }
    
    // Helper function to get image name based on selected floor
    func imageName(for floor: String) -> String {
        switch floor {
        case "Standnummer":
            return "Standnummer"
        case "Kart":
            return "kart"
        default:
            return "" // Default case which should never be hit
        }
    }
}

struct GrieghallenView_Previews: PreviewProvider {
    static var previews: some View {
        GrieghallenView()
    }
}
