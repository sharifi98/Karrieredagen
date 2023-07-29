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
            ZStack {
                Image("marinebackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack {
                        VStack {
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
                        }
                        .padding(.top)
                        
                        HStack {
                            Text("Hvem er vi?")
                                .foregroundColor(Color("KDOrange"))
                                .font(.custom("AvenirNext-Bold", size: 30))
                                .padding()
                            
                            Spacer()
                        }
                        
                        VStack {
                            Text("I Karrierestudio reiser representanter fra studentorganisasjonen Springbrettet rundt i vårt langstrakte land for å snakke med sentrale personer i norsk næringsliv. Tidligere gjester inkluderer bl.a. Sentralbanksjef Øystein Olsen og Konsernsjefen i Schibsted, Kristin Skogen Lund.")
                            
                            Text(" ")
                            
                            Text("I samtalene hører vi bl.a. historier om næringslivsledernes vei dit de er i dag, deres råd til unge og fremadstormende, og hva de ville gjort annerledes om de var i 20-årene med den kunnskapen de har i dag. På veien forsøker vi å finne ut av hva fremtidens grønne norske næringsliv skal bestå av, og hvilke muligheter det åpner for oss studenter.")
                        }
                        .padding(5)
                        .font(.custom("AvenirNext-Bold", size: 20))
                        .foregroundColor(.white)
                        
                        VStack {
                            Link(destination: URL(string: "https://open.spotify.com/show/6ASAsnRx8KDiNvBpnpTeWQ?utm_source=generator")!) {
                                HStack {
                                    Image("spotify")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .aspectRatio(contentMode: .fit)

                                    Text("Lytt på Spotify")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .background(Color.green)
                                .cornerRadius(15)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                            }
                            
                            Link(destination: URL(string: "https://instagram.com/karrierestudio?igshid=MzRlODBiNWFlZA==")!) {
                                HStack {
                                    Image("instagramreal")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .aspectRatio(contentMode: .fit)
                                    Text("Følg oss på Instagram")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .background(Color.pink)
                                .cornerRadius(15)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                            }
                        }
                        .padding(.bottom)
                    }
                    .padding(.horizontal)
                    Spacer()
                        .frame(height: 90)
                }
            }
            .navigationBarWithTransparentBackground() // <-- outside of ScrollView
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Text("Karrierestudio")
                        .font(.custom("AvenirNext-Bold", size: 20))
                        .foregroundColor(Color("KDOrange"))
                }
            }
        }
    }
}

struct Karrierestudio_Previews: PreviewProvider {
    static var previews: some View {
        Karrierestudio()
    }
}
