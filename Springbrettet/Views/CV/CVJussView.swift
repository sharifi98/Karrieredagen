//
//  CVJussView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 30/07/2023.
//

import SwiftUI

struct CVJussView: View {
    private static let template = CVTemplate(
        title: "CV - Rettsvitenskap",
        sections: [
            (heading: "Personlige Detaljer:", body: "Navn: Laura Lov\nAdresse: Juridisk Jentevei 30, 9012 Jus, Norge\nTelefon: 87654321\nEpost: laura.lov@example.com\nLinkedIn: linkedin.com/in/laura-lov"),
            (heading: "Utdannelse:", body: "Bachelor i Rettsvitenskap, Universitetet i Oslo, 2020 - 2023"),
            (heading: "Arbeidserfaring:", body: "Sommerintern, Lov og Rett AS, juni 2022 - august 2022\nUtførte juridisk forskning for pågående rettssaker\nBidro i utformingen av juridiske dokumenter og korrespondanse"),
            (heading: "Ferdigheter:", body: "Juridisk forskning og skriving\nGrunnleggende prosessrett\nForhandling og megling"),
            (heading: "Sertifiseringer:", body: "Sertifisert i juridisk forskning og skriving"),
            (heading: "Referanser:", body: "Kan gis ved forespørsel"),
        ]
    )

    var body: some View {
        CVTemplateView(template: Self.template)
    }
}

struct CVJussView_Previews: PreviewProvider {
    static var previews: some View {
        CVJussView()
    }
}
