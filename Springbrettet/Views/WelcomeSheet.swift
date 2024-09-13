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
        ZStack {
            BackgroundSB2()
                .ignoresSafeArea() // Ensure background covers the entire screen
            VStack(spacing: 30) {
                Spacer()

                // Image Section
                Image("gp")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 350)
                    .cornerRadius(20)
                    .shadow(radius: 10)

                // Welcome Text
                Text("Velkommen til")
                    .font(.title2.weight(.semibold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)

                Text("Springbrett-appen")
                    .font(.largeTitle.bold())
                    .foregroundColor(Color("KDOrange"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // Description Text
                Text("""
                I denne appen finner du informasjon om Springbrettet, våre prosjekter og ikke minst vår årlige karrieredag!
                """)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Spacer()

                // Dismiss Button
                Button(action: {
                    onDismiss()
                }) {
                    Text("Ta meg til appen!")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("KDOrange"))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                Spacer()
            }
            .padding()
        }
    }
}

struct WelcomeSheet_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WelcomeSheet(onDismiss: {})
                .environment(\.colorScheme, .light) // Preview in light mode
            WelcomeSheet(onDismiss: {})
                .environment(\.colorScheme, .dark)  // Preview in dark mode
        }
    }
}
