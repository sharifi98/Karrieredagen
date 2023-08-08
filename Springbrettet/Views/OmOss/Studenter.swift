//
//  Studenter.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 08/08/2023.
//

import SwiftUI

struct Studenter: View {
    var body: some View {
        VStack {
            List { // Add some spacing between Text views
                Section {
                    Text("Ta kontakt")
                        .font(.custom("AvenirNext-Bold", size: 30))
                        .foregroundColor(Color("KDOrange"))
                    Text("Vil du vite mer om oss i Springbrettet? Sjekk oss gjerne ut på sosiale medier, og ikke nøl med å henvende deg på mail eller Facebook for spørsmål!\n\nInteressert i å bli medlem i Springbrettet? Vi rekrutterer i starten av hvert semester. Følg med på facebook og hjemmesiden vår for mer informasjon!")
                        .font(.custom("AvenirNext-Regular", size: 20))
                    // Replace "TextColor" with the appropriate color name if needed
                        .padding() // Add some padding around the text
                }
            }
            
            Link(destination: URL(string: "https://open.spotify.com/show/6ASAsnRx8KDiNvBpnpTeWQ?utm_source=generator")!) {
                Text("Lytt på Spotify")
                    .padding()
                    .background(Color("KDOrange"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .overlay(
                        Image(systemName: "music.note")
                            .foregroundColor(.white)
                    , alignment: .leading)
            }
            .buttonStyle(PlainButtonStyle())

            Link(destination: URL(string: "https://instagram.com/karrierestudio?igshid=MzRlODBiNWFlZA==")!) {
                Text("Følg oss på Instagram")
                    .padding()
                    .background(Color("KDOrange"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .overlay(
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                    , alignment: .leading)
            }
            .buttonStyle(PlainButtonStyle())


        }
        
        
    }
}

struct Studenter_Previews: PreviewProvider {
    static var previews: some View {
        Studenter()
    }
}
