//
//  GrieghallenView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 15/08/2023.
//

import SwiftUI

struct GrieghallenView: View {
    
    var floors = ["Første etasje", "Andre etasje"]
    @State private var selectedFloor = "Første etasje"
    
    var body: some View {
        ZStack {
            VStack {
                    .foregroundStyle(.blue)
                Picker("Velg etasje", selection: $selectedFloor) {
                    ForEach(floors, id: \.self) {
                        Text("\($0)") 
                    }
                }
                .pickerStyle(.segmented)
                Image(imageName(for: selectedFloor))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
            }
        }
    }
    
    // Helper function to get image name based on selected floor
    func imageName(for floor: String) -> String {
        switch floor {
        case "Første etasje":
            return "1etasje"
        case "Andre etasje":
            return "2etasje"
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
