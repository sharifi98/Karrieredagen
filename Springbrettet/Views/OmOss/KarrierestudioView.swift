//
//  ProsjekterView.swift
//  Karrieredagen
//
//  Created by Hossein Sharifi on 09/07/2023.
//

import SwiftUI

struct Karrierestudio: View {
    var body: some View {
        NavigationView {
            
            List {
                ZStack {
                    Image("Karrierestudio")
                        .resizable()
                        .frame(width: 380, height: 350)
                        .clipped()
                        .cornerRadius(10)
                    
                    Text("Karrierestudio")
                        .foregroundColor(.white)
                        .font(.system(size: 46, weight: .semibold))
                        .offset(y: 150)
                }
                
                
                HStack {
                    Text("Hvem er vi?")
                        .foregroundColor(Color("KDOrange"))
                        .font(.custom("AvenirNext-Bold", size: 30))
                    
                    Spacer()
                }
                
                VStack {
                    Text("I Karrierestudio reiser representanter fra studentorganisasjonen Springbrettet rundt i vårt langstrakte land for å snakke med sentrale personer i norsk næringsliv. Tidligere gjester inkluderer bl.a. Sentralbanksjef Øystein Olsen og Konsernsjefen i Schibsted, Kristin Skogen Lund.")
                    
                    Text(" ")
                    
                    Text("I samtalene hører vi bl.a. historier om næringslivsledernes vei dit de er i dag, deres råd til unge og fremadstormende, og hva de ville gjort annerledes om de var i 20-årene med den kunnskapen de har i dag. På veien forsøker vi å finne ut av hva fremtidens grønne norske næringsliv skal bestå av, og hvilke muligheter det åpner for oss studenter.")
                }
                .padding(5)
                .foregroundColor(.white)
                
                Section {
                    Link(destination: URL(string: "https://open.spotify.com/show/6ASAsnRx8KDiNvBpnpTeWQ?utm_source=generator")!) {
                        Label("Lytt på Spotify", systemImage: "music.note")
                    }
                    .foregroundColor(Color("KDOrange"))
                    
                    Link(destination: URL(string: "https://instagram.com/karrierestudio?igshid=MzRlODBiNWFlZA==")!) {
                        Label("Følg oss på Instagram", systemImage: "camera")
                    }
                    .foregroundColor(Color("KDOrange"))
                }
                
            }
            .listStyle(.grouped)
            .navigationBarWithTransparentBackground() // <-- outside of ScrollView
        }
    }
}

struct Karrierestudio_Previews: PreviewProvider {
    static var previews: some View {
        Karrierestudio()
    }
}
