//
//  WelcomeSheet.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 20/09/2023.
//

import SwiftUI

struct WelcomeSheet: View {
    let onDismiss: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image("gp")
                .resizable()
                .frame(width: 450, height: 280)
            
            Text("Velkommen til")
                .font(.title)
                .multilineTextAlignment(.center)
            
            
            Text("Springbrett-appen")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(Color("KDOrange"))
                .padding(.horizontal, 10)
                .padding(.vertical, 5)

            
            Text("I denne appen så finner du informasjon om Springbrettet, våres prosjekter og ikkje minst vår årlige karrieredage")
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button("Ta meg til appen!") {
                onDismiss()
            }
            .padding()
            .background(Color("KDOrange"))
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
    }
}



struct WelcomeSheet_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeSheet(onDismiss: {})
    }
}
