//
//  JobTipsView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 29/07/2023.
//

import SwiftUI



import SwiftUI

struct CVTipsView: View {
    @State private var isSheetPresented = false
    @State private var selectedCV: CVViewType?

    let tips = [
        ("1. Vær tydelig og relevant i CV og søknad", "Mange bruker veldig lite tid på både CV og søknad, og det kan føre til at man ikke skiller seg ut eller viser hva man faktisk kan bidra med i jobben. Det er viktig å være tydelig og relevant i både CV og søknad, slik at arbeidsgiveren ser hva du har å tilby."),
        
    ]

    enum CVViewType {
        case IT
        case Economics
        case Juss
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack {
                    Text("Springbrettet til din drømmejobb")
                        .font(.system(size: 20))
                        .foregroundColor(Color("KDOrange"))
                    Text("Tips og Eksempler")
                        .foregroundColor(Color("KDOrange"))
                    Text("Her finner du nyttige råd og anbefalinger for å hjelpe deg med å skrive en overbevisende CV og søknad. Disse tipsene er designet for å hjelpe deg med å fremheve dine ferdigheter, erfaringer og unike kvaliteter, slik at du kan skille deg ut fra andre søkere. Scroll ned for å se tipsene. Husk, øvelse gjør mester! For å gi deg en bedre forståelse av hvordan disse tipsene kan anvendes i praksis, har vi inkludert eksempler på en CV og søknad for forskjellige studiebakgrunner (IT, økonomi, juss og HR) helt nederst på siden.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding()
                }
                
                HStack {
                    Spacer()

                    Button(action: {
                        selectedCV = .IT
                        isSheetPresented.toggle()
                    }) {
                        VStack {
                            Text("IT-CV")
                            Image(systemName: "list.clipboard")
                        }
                    }
                    .foregroundColor(.white)
                    .padding()

                    Spacer()

                    Button(action: {
                        selectedCV = .Economics
                        isSheetPresented.toggle()
                    }) {
                        VStack {
                            Text("ØKAD-CV")
                            Image(systemName: "list.clipboard")
                        }
                    }
                    .foregroundColor(.white)
                    .padding()

                    Spacer()

                    Button(action: {
                        selectedCV = .Juss
                        isSheetPresented.toggle()
                    }) {
                        VStack {
                            Text("JUSS-CV")
                            Image(systemName: "scalemass")
                        }
                    }
                    .foregroundColor(.white)
                    .padding()

                    Spacer()
                }
                
                ForEach(tips, id: \.0) { tipTitle, tipContent in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(tipTitle)
                            .font(.headline)
                            .foregroundColor(Color("KDOrange"))
                        Text(tipContent)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                }
                .padding(.horizontal)
            }
            .padding(.top)
            .sheet(isPresented: $isSheetPresented) {
                switch selectedCV {
                case .IT:
                    CVITView()
                case .Economics:
                    CVEconomicsView()
                case .Juss:
                    CVJussView()
                default:
                    Text("No selection")
                }
            }
        }
    }
}

struct CVTipsView_Previews: PreviewProvider {
    static var previews: some View {
        CVTipsView()
    }
}



let tips = [
    ("1. Vær tydelig og relevant i CV og søknad", "Mange bruker veldig lite tid på både CV og søknad, og det kan føre til at man ikke skiller seg ut eller viser hva man faktisk kan bidra med i jobben. Det er viktig å være tydelig og relevant i både CV og søknad, slik at arbeidsgiveren ser hva du har å tilby."),
    
    ("2. Vis konkrete eksempler", "Det er viktig å vise konkrete eksempler på hva man har gjort tidligere, og hvordan dette kan være relevant for den jobben man søker på. Dette viser at du har erfaring som kan være nyttig for arbeidsgiveren."),
    
    ("3. Reflekter over dine egne egenskaper og ferdigheter", "Reflekter over dine egne egenskaper og ferdigheter, og hvordan disse kan være nyttige for arbeidsgiveren. Dette vil hjelpe deg med å finne ut hva som gjør deg unik, og hvordan du kan bruke dette til din fordel når du søker på jobber."),
    
    ("4. Unngå vanlige feil", "Unngå vanlige feil som å skrive for mye eller for lite, ikke tilpasse søknaden til stillingen eller arbeidsgiveren, eller ikke vise entusiasme og motivasjon for jobben. Husk at en god CV og søknad kan være avgjørende for om du blir innkalt til intervju eller ikke."),
    
    ("5. Ha en god LinkedIn-profil", "LinkedIn er en viktig plattform for jobbsøking, og det er der mange rekrutterere befinner seg. Sørg for å ha en god LinkedIn-profil som viser dine ferdigheter og erfaringer på en tydelig måte."),
    
    ("6. Still spørsmål", "Still spørsmål når du søker på jobber, slik at du viser interesse og engasjement for stillingen. Dette kan også hjelpe deg med å finne ut mer om stillingen"),
    
    ("7. Skriv en beskrivelse", "Det kan være lurt å skrive en kort beskrivelse av deg selv ved siden av CV-en, slik at arbeidsgiveren får et inntrykk av hvem du er og hva du kan tilby. Dette kan også hjelpe deg med å skille deg ut fra andre søkere."),
    
    ("8. Tilpass søknaden til stillingen", "Det er viktig å tilpasse søknaden til stillingen du søker på, og vise hvordan dine ferdigheter og erfaringer kan være relevante for denne spesifikke jobben. Dette viser at du har gjort research og virkelig ønsker denne jobben."),
    
    ("9. Vær konkret", "Vær konkret når du beskriver dine erfaringer og ferdigheter i CV-en og søknaden. Gi eksempler på hva du har gjort tidligere, og hvordan dette kan være relevant for den jobben du søker på."),
    
    ("10. Vis entusiasme", "Vis entusiasme og motivasjon for jobben i både CV-en og søknaden. Dette viser at du virkelig ønsker denne jobben, og at du vil gjøre ditt beste for å utføre den godt hvis du får den."),
]
