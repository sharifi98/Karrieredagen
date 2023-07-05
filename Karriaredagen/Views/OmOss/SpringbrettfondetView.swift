import SwiftUI

struct SpringbrettfondetView: View {
    var body: some View {
        ZStack {
            Image("marinebackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Hva er Springbrettfondet?")
                        .font(.title)
                        .padding()
                        .foregroundColor(Color("KDOrange"))
                    
                    Text("""
                    Springbrettfondet er en utvidelse av Springbrettets innsats for å bygge broer mellom studenter og næringslivet på Vestlandet. Fondet tilbyr nå økonomisk støtte til studenter og studentgrupper for initiativer som støtter vår organisasjonsfilosofi og forbedrer studentenes engasjement.
                    """)
                    .padding()
                    .foregroundColor(.white)
                    
                    Text("Hvem kan søke støtte?")
                        .font(.title)
                        .padding()
                        .foregroundColor(Color("KDOrange"))
                    
                    Text("""
Økonomisk støtte kan søkes av enhver student eller studentgruppe, men visse kriterier må oppfylles. Dette inkluderer at tiltaket fremmer samarbeid mellom arbeidslivet og studentene, det må være behov for økonomisk støtte for at arrangementet kan gjennomføres, og det er en øvre grense for støtte per semester. Detaljerte krav og retningslinjer finner du i lenken under.
""")
                    .padding()
                    .foregroundColor(.white)
                    
                    VStack {
                        Link(destination: URL(string: "https://springbrettet.org/vedtekterspringbrettfondet")!) {
                            Text("Krav og retningslinjer")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.white)
                                .background(.gray)
                                .cornerRadius(40)
                        }
                        
                        
                        Link(destination: URL(string: "https://forms.gle/7knVYGPF7Ehh3RCUA")!) {
                            Text("Søknadsskjema")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color("KDOrange"))
                                .cornerRadius(40)
                        }
                        
                    }
                    .padding()
                    
                    Text("""
Søknader til Springbrettfondet leveres via lenken nedenfor. Vi vil vurdere din søknad og kontakte deg om utfallet. Fristene er 1. oktober for høstsemesteret og 1. mars for vårsemesteret. Søknader utenfor disse fristene blir ikke vurdert.
""")
                    .padding()
                    .foregroundColor(.white)
                    
                    
                    Text("Sjekk ut initiativer vi har støttet tidligere!")
                        .font(.title)
                        .padding()
                        .foregroundColor(Color("KDOrange"))
                    
                    
                }
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Text("Springbrettfondet")
                            .font(.system(size: 36, weight: .semibold))
                            .foregroundColor(Color("KDOrange"))
                    }
                }
                .navigationBarWithOrangeBackground()
                .padding()

            }
        }
    }
}

struct SpringbrettfondetView_Previews: PreviewProvider {
    static var previews: some View {
        SpringbrettfondetView()
    }
}
