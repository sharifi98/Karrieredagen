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
            Image("marinebackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Hva er Springbrettfondet?")
                        .font(.title)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.leading)
                    
                    Text("""
                    Springbrettfondet er en utvidelse av Springbrettets innsats for å bygge broer mellom studenter og næringslivet på Vestlandet. Fondet tilbyr nå økonomisk støtte til studenter og studentgrupper for initiativer som støtter vår organisasjonsfilosofi og forbedrer studentenes engasjement.
                    """)
                    .padding()
                    .foregroundColor(.white)
                    
                    Text("Hvem kan søke støtte?")
                        .font(.title)
                        .padding(.leading)
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
                        .padding(.leading)
                        .foregroundColor(Color("KDOrange"))
                    
                    VStack {
                        Text("Norsk Akuttmedisinsk Studentforum (2023)")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                    
                    ScrollView(.horizontal) {
                        VStack {
                            Text("Arrangementet er et tverrfaglig samarbeid med foredrag og medisinske simuleringer.")
                                .foregroundColor(.white)
                            
                            LazyHStack(alignment: .top) {
                                
                                Image(imageNames[0])
                                    .resizable()
                                    .frame(width: 360, height: 275)
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .shadow(color: Color.black.opacity(0.3), radius: 7, x: 10, y: 10)
                                    .padding(5)
                                Image(imageNames[1])
                                    .resizable()
                                    .frame(width: 360, height: 275)
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .shadow(color: Color.black.opacity(0.3), radius: 7, x: 10, y: 10)
                                    .padding(5)
                            }
                        }
                    }
                    }
                    
                    VStack {
                        
                        Text("Sampolkonferansen (2021)")
                            .foregroundColor(.white)
                            .font(.headline)
                        
                        ScrollView(.horizontal, showsIndicators: true) {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("SAMPOL-konferansen 2021 tok for seg temaet ulikhet, og bærte tittelen «Grenseløs ulikhet: er verdenssamfunnet på bristepunktet?». ")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                
                                
                                LazyHStack(alignment: .top) {
                                    Image(imageNames[2])
                                        .resizable()
                                        .frame(width: 360, height: 275)
                                        .scaledToFit()
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .shadow(color: Color.black.opacity(0.3), radius: 7, x: 10, y: 10)
                                        .padding(5)
                                    
                                    Image(imageNames[3])
                                        .resizable()
                                        .frame(width: 360, height: 275)
                                        .scaledToFit()
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .shadow(color: Color.black.opacity(0.3), radius: 7, x: 10, y: 10)
                                        .padding(5)
                                    
                                    Image(imageNames[4])
                                        .resizable()
                                        .frame(width: 360, height: 275)
                                        .scaledToFit()
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .shadow(color: Color.black.opacity(0.3), radius: 7, x: 10, y: 10)
                                        .padding(5)
                                }
                            }
                        }
                    }
                    
                    
                    
                }
                .navigationBarWithTransparentBackground()
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Text("Springbrettfondet")
                            .font(.system(size: 36, weight: .semibold))
                            .foregroundColor(Color("KDOrange"))
                    }
                }
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
