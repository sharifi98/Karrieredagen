//
//  VorsjWelcomeSheet.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 07/12/2023.
//

import SwiftUI

struct VorsjWelcomeSheet: View {
    let onDismiss: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("Velkommen til")
                .font(.title)
                .multilineTextAlignment(.center)
            
            
            Text("Vorsj-Spill!")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(Color.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)

            
            Text("''Ivar Aasen gikk rundt i Norge for å samle på dialekt. Asbjørnsen og Moe reiste rundt i Norge for å samle på eventyr. Jeg? Jeg samler på drikkeleker''")
            
                .italic()
                .multilineTextAlignment(.center)
            Text("-HS")
                .italic()
            
            Spacer()
            
            Button("Ta meg til lekene!") {
                onDismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    VorsjWelcomeSheet(onDismiss: {})
}
