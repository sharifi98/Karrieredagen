//
//  OmOssView.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 02/06/2023.
//

import SwiftUI

struct HvemErSpringbrettetView: View {    
    let imageNames = [
        "DSC06717",
        "DSC06261-2",
        "DSC06217",
        "DSC06236",
        "DSC06272",
        "DSC06279",
        "DSC06291",
        "DSC06322",
        "DSC06337-2",
        "DSC06439",
        "DSC06452",
        "DSC06466",
        "DSC06482",
        "DSC06485",
        "DSC06492",
        "DSC06633",
        "DSC06728",
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(Color(red: 0.046, green: 0.127, blue: 0.21))
                    .ignoresSafeArea()
                
                ScrollView(.vertical) { // Wrapping everything inside a single ScrollView
                    VStack {
                        // ScrollView for images
                        ScrollView(.horizontal) {
                            LazyHStack(alignment: .top) {
                                ForEach(imageNames, id: \.self) { imageName in
                                    Image(imageName)
                                        .resizable()
                                        .frame(width: 360, height: 275)
                                        .scaledToFit()
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .shadow(color: Color.black.opacity(0.3), radius: 7, x: 10, y: 10)
                                        .padding(5)
                                }
                            }
                        }
                        
                        // Regular VStack for text
                        VStack {
                            
                            Divider()
                            
                            Text("Springbrettet er en av Bergens fremste studentorganisasjoner, og jobber med å minske avstanden mellom studenter og næringsliv. Vi er en tverrfaglig organisasjon som består av medlemmer fra et bredt spekter av ulike studieretninger. Springbrettet ble opprettet i 2007, da en gjeng engasjerte og nytenkende studenter gikk sammen for å avholde Karrieredager i Grieghallen. Siden den gang har organisasjonen hatt en enorm utvikling. I dag skaper vi noen av de viktigste møteplassene mellom studenter og næringsliv, og tilbyr en fantastisk læringsarena for våre medlemmer.\n \n Karrieredagen i Grieghallen er selve flaggskipet til Springbrettet, og er Vestlandets største karrieredagsmesse. Her møtes tusenvis av studenter opp mot 70 ulike bedrifter til karrieredagsmesse, foredrag og bankett. Karrieredagen gir den innsikten man ikke tilegner seg på skolebenken, og her vil man finne opplegg for enhver smak.\n\nVi søker hele tiden etter å knytte næringsliv og studenter sammen på nye og kreative måter. I tillegg til våre Karrieredager på høsten, arrangerer vi også en rekke andre arrangementer i løpet av året. Eksempler er ulike seminarer, kurs eller konkurranser. Fra og med 2020 har Springbrettet også drevet Podcasten «Karrierestudio», hvor vi inviterer inn norske næringslivsledere for å dele sine råd og erfaringer.")
                                .foregroundStyle(.white)
                        }
                        .padding()
                    }
                }
                .navigationBarTitle("Hva er springbrettet?", displayMode: .automatic)
                .navigationBarWithOrangeBackground()
                
                
                
            }
        }
    }
}

struct HvemErSpringbrettetView_Previews: PreviewProvider {
    static var previews: some View {
        HvemErSpringbrettetView()
    }
}