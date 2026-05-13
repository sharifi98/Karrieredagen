//
//  CVEconomicsView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 30/07/2023.
//

import SwiftUI

struct CVEconomicsView: View {
    private static let template = CVTemplate(
        title: "CV - Økonomi",
        sections: [
            (heading: "Personlige Detaljer:", body: "Navn: Emil Økonomi\nAdresse: Finansveien 20, 5678 Økonomi, Norge\nTelefon: 87654321\nEpost: emil.oekonomi@example.com\nLinkedIn: linkedin.com/in/emil-økonomi"),
            (heading: "Utdannelse:", body: "Bachelor i Økonomi og Administrasjon, Handelshøyskolen BI, 2020 - 2023"),
            (heading: "Arbeidserfaring:", body: "Sommerintern, FinansGruppen AS, juni 2022 - august 2022\nUtformet en ny økonomisk rapporteringsmodell som forbedret effektiviteten med 15%\nJobbet i et team med fokus på Lean Six Sigma-prinsipper"),
            (heading: "Ferdigheter:", body: "Økonomisk analyse og modellering\nRegnskap\nMarkedsføringsstrategi"),
            (heading: "Sertifiseringer:", body: "Sertifisert i Lean Six Sigma Green Belt"),
            (heading: "Referanser:", body: "Kan gis ved forespørsel"),
        ]
    )

    var body: some View {
        CVTemplateView(template: Self.template)
    }
}

struct CVEconomicsView_Previews: PreviewProvider {
    static var previews: some View {
        CVEconomicsView()
    }
}
