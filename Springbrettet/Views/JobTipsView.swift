//
//  JobTipsView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 29/07/2023.
//

import SwiftUI

struct JobTipsView: View {
    let tips = [
        "Vær tydelig og relevant i CV og søknad: Mange bruker veldig lite tid på både CV og søknad, og det kan føre til at man ikke skiller seg ut eller viser hva man faktisk kan bidra med i jobben. Det er viktig å være tydelig og relevant i både CV og søknad, slik at arbeidsgiveren ser hva du har å tilby.",
        "Vis konkrete eksempler: Det er viktig å vise konkrete eksempler på hva man har gjort tidligere, og hvordan dette kan være relevant for den jobben man søker på. Dette viser at du har erfaring som kan være nyttig for arbeidsgiveren.",
        "Reflekter over dine egne egenskaper og ferdigheter: Reflekter over dine egne egenskaper og ferdigheter, og hvordan disse kan være nyttige for arbeidsgiveren. Dette vil hjelpe deg med å finne ut hva som gjør deg unik, og hvordan du kan bruke dette til din fordel når du søker på jobber.",
        // ... (add the rest of your tips here)
    ]

    var body: some View {
        NavigationView {
            List(tips, id: \.self) { tip in
                Text(tip)
                    .padding()
            }
            .navigationTitle("Jobb Søketips")
        }
    }
}

struct JobTipsView_Previews: PreviewProvider {
    static var previews: some View {
        JobTipsView()
    }
}
