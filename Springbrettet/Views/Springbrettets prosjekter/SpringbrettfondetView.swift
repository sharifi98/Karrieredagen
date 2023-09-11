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
        
        ZStack {
            Background()
            ScrollView {
                VStack(spacing: 20) { // Added spacing between VStacks
                    
                    // Title Section
                    VStack(alignment: .leading) {
                        Text("Hva er Springbrettfondet?")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color("KDOrange"))
                    }
                    .padding(.horizontal) // Added horizontal padding
                    
                    Text("""
                        Springbrettfondet er en utvidelse av Springbrettets innsats for å bygge broer mellom studenter og næringslivet på Vestlandet. Fondet tilbyr nå økonomisk støtte til studenter og studentgrupper for initiativer som støtter vår organisasjonsfilosofi og forbedrer studentenes engasjement.
                        """)
                        .padding()
                        .foregroundColor(.white)
                    
                    // Who Can Apply Section
                    VStack(alignment: .leading) {
                        Text("Hvem kan søke støtte?")
                            .font(.title)
                            .padding(.horizontal) // Added horizontal padding
                            .foregroundColor(Color("KDOrange"))
                    }
                    
                    Text("""
                        Økonomisk støtte kan søkes av enhver student eller studentgruppe, men visse kriterier må oppfylles. Dette inkluderer at tiltaket fremmer samarbeid mellom arbeidslivet og studentene, det må være behov for økonomisk støtte for at arrangementet kan gjennomføres, og det er en øvre grense for støtte per semester. Detaljerte krav og retningslinjer finner du i lenken under.
                        """)
                        .padding()
                        .foregroundColor(.white)
                    
                    Link(destination: URL(string: "https://springbrettet.org/vedtekterspringbrettfondet")!) {
                        Label("Krav og retningslinjer", systemImage: "doc.text")
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
                            .foregroundColor(.green)
                            .padding()
                    }
                    
                    // Supported Initiatives Section
                    VStack {
                        Text("Sjekk ut initiativer vi har støttet tidligere!")
                            .font(.title)
                            .padding(.horizontal) // Added horizontal padding
                            .foregroundColor(Color("KDOrange"))
                    }
                    
                    // Example Initiatives
                    ExampleInitiativeView(
                        title: "Norsk Akuttmedisinsk Studentforum",
                        year: "2023",
                        imageNames: Array(imageNames.prefix(2))
                    )
                    
                    ExampleInitiativeView(
                        title: "Sampolkonferansen",
                        year: "2021",
                        imageNames: Array(imageNames.suffix(3))
                    )
                    
                    // Added padding to the bottom to avoid content being too close to the bottom edge
                    Spacer().frame(height: 20)
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
}

struct SpringbrettfondetView_Previews: PreviewProvider {
    static var previews: some View {
        SpringbrettfondetView()
    }
}


struct ExampleInitiativeView: View {
    let title: String
    let year: String
    let imageNames: [String]
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            
            Text(year)
            
            TabView {
                ForEach(imageNames, id: \.self) { imageName in
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
        .padding(.horizontal) // Added horizontal padding
    }
}
