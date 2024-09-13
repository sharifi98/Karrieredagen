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
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Spacer()


                Image("gp")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 350)
                    .cornerRadius(20)
                    .shadow(radius: 10)

                Text("Velkommen til")
                    .font(.title2.weight(.semibold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)

                Text("Springbrett-appen")
                    .font(.largeTitle.bold())
                    .foregroundColor(Color("KDOrange"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Text("""
                I denne appen finner du informasjon om Springbrettet, våre prosjekter og ikke minst vår årlige karrieredag!
                """)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Spacer()

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
                .environment(\.colorScheme, .light)
            WelcomeSheet(onDismiss: {})
                .environment(\.colorScheme, .dark)
        }
    }
}
