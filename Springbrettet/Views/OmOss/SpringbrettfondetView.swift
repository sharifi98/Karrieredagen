import SwiftUI

struct SpringbrettfondetView: View {
    
    let imageNames = [
        "Screenshot 2023-07-05 at 15-56-54 Springbrettfondet — Springbrettet",
        "Screenshot 2023-07-05 at 15-57-16 Springbrettfondet — Springbrettet",
        "Screenshot 2023-07-05 at 15-57-32 Springbrettfondet — Springbrettet",
        "Screenshot 2023-07-05 at 15-57-50 Springbrettfondet — Springbrettet",
        "Screenshot 2023-07-05 at 15-58-05 Springbrettfondet — Springbrettet"
    ]
    
    var body: some View {
        
        List {
            VStack {
                Text("Hva er Springbrettfondet?")
                    .font(.title)
                    .foregroundColor(Color("KDOrange"))
                
                Text("""
                        Springbrettfondet er en utvidelse av Springbrettets innsats for å bygge broer mellom studenter og næringslivet på Vestlandet. Fondet tilbyr nå økonomisk støtte til studenter og studentgrupper for initiativer som støtter vår organisasjonsfilosofi og forbedrer studentenes engasjement.
                        """)
                .padding()
                .foregroundColor(.white)
            }
            
            
            
            VStack {
                Text("Hvem kan søke støtte?")
                    .font(.title)
                    .padding(.leading)
                .foregroundColor(Color("KDOrange"))
            }
            
            Text("""
Økonomisk støtte kan søkes av enhver student eller studentgruppe, men visse kriterier må oppfylles. Dette inkluderer at tiltaket fremmer samarbeid mellom arbeidslivet og studentene, det må være behov for økonomisk støtte for at arrangementet kan gjennomføres, og det er en øvre grense for støtte per semester. Detaljerte krav og retningslinjer finner du i lenken under.
""")
            .padding()
            .foregroundColor(.white)
            
            VStack {
                Link(destination: URL(string: "https://springbrettet.org/vedtekterspringbrettfondet")!) {
                    Label("Krav og retningslinjer", systemImage: "doc.text")
                }
                .foregroundColor(.gray)
                .padding()
            }
            
            Text("""
Søknader til Springbrettfondet leveres via lenken nedenfor. Vi vil vurdere din søknad og kontakte deg om utfallet. Fristene er 1. oktober for høstsemesteret og 1. mars for vårsemesteret. Søknader utenfor disse fristene blir ikke vurdert.
""")
            .padding()
            .foregroundColor(.white)
            
            Link(destination: URL(string: "https://forms.gle/7knVYGPF7Ehh3RCUA")!) {
                        Label("Søknadsskjema", systemImage: "pencil")
                    }
            .foregroundColor(.green)
                    .padding()
            
            Text("Sjekk ut initiativer vi har støttet tidligere!")
                .font(.title)
                .padding(.leading)
                .foregroundColor(Color("KDOrange"))
            
            VStack {
                Text("Norsk Akuttmedisinsk Studentforum")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("2023")
                
                VStack {
                    
                    TabView {
                        ForEach(imageNames[0...1], id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(color: Color.black.opacity(0.3), radius: 7, x: 10, y: 10)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .frame(height: 275)
                }
            }
            
            VStack {
                Text("Sampolkonferansen")
                    .foregroundColor(.white)
                    .font(.headline)
                Text("2021")
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    TabView {
                        ForEach(imageNames[2...4], id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(color: Color.black.opacity(0.3), radius: 7, x: 10, y: 10)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .frame(height: 275)
                }
            }
            
            
            .navigationBarWithTransparentBackground()
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Text("Springbrettfondet")
                        .font(.custom("AvenirNext-Bold", size: 20))
                        .foregroundColor(Color("KDOrange"))
                }
            }
            .padding()
            
        }
        .listStyle(.grouped)
    }
}

struct SpringbrettfondetView_Previews: PreviewProvider {
    static var previews: some View {
        SpringbrettfondetView()
    }
}
