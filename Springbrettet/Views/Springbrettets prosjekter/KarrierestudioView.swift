//
//  ProsjekterView.swift
//  Karrieredagen
//
//  Created by Hossein Sharifi on 09/07/2023.
//

import SwiftUI

struct Karrierestudio: View {
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundSB()
                ScrollView {
                    VStack(spacing: 30) {
                        headerSection
                        descriptionSection
                        listenSection
                        followSection
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 30)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Karrierestudio")
                        .font(.kdHeading(24))
                        .foregroundColor(.kdOrange)
                }
            }
        }
    }

    var headerSection: some View {
        ZStack(alignment: .bottom) {
            Image("Karrierestudio")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .clipped()
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.7)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .cornerRadius(20)

            Text("Karrierestudio")
                .font(.kdHeading(46))
                .foregroundColor(.white)
                .padding(.bottom)
        }
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
    }

    var descriptionSection: some View {
        VStack(spacing: 20) {
            descriptionText(
                "I Karrierestudio reiser representanter fra studentorganisasjonen Springbrettet rundt i vårt langstrakte land for å snakke med sentrale personer i norsk næringsliv. Tidligere gjester inkluderer bl.a. Sentralbanksjef Øystein Olsen og Konsernsjefen i Schibsted, Kristin Skogen Lund."
            )

            descriptionText(
                "I samtalene hører vi bl.a. historier om næringslivsledernes vei dit de er i dag, deres råd til unge og fremadstormende, og hva de ville gjort annerledes om de var i 20-årene med den kunnskapen de har i dag. På veien forsøker vi å finne ut av hva fremtidens grønne norske næringsliv skal bestå av, og hvilke muligheter det åpner for oss studenter."
            )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.kdBackground.opacity(0.8))
        )
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
    }

    func descriptionText(_ text: String) -> some View {
        Text(text)
            .font(.kdBody(16))
            .foregroundColor(.kdText)
            .multilineTextAlignment(.center)
    }

    var listenSection: some View {
        LinkButton(
            title: "Lytt på Spotify",
            icon: "music.note",
            url: "https://open.spotify.com/show/6ASAsnRx8KDiNvBpnpTeWQ?utm_source=generator",
            color: .green
        )
    }

    var followSection: some View {
        LinkButton(
            title: "Følg oss på Instagram",
            icon: "camera",
            url: "https://instagram.com/karrierestudio?igshid=MzRlODBiNWFlZA==",
            color: .purple
        )
    }
}


struct Karrierestudio_Previews: PreviewProvider {
    static var previews: some View {
        Karrierestudio()
    }
}
