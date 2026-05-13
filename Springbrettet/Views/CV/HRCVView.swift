//
//  HRCVView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 18/08/2023.
//

import SwiftUI

struct HRCVView: View {
    private static let template = CVTemplate(
        title: "CV - HR",
        sections: [
            (heading: "Personlige Detaljer:", body: "Navn: Hanna HR\nAdresse: Personalveien 15, 5678 Ledelse, Norge\nTelefon: 87654321\nEpost: hanna.hr@example.com\nLinkedIn: linkedin.com/in/hanna-hr"),
            (heading: "Utdannelse:", body: "Bachelor i Human Resources, Universitetet i Oslo, 2020 - 2023"),
            (heading: "Arbeidserfaring:", body: "HR Intern, PeopleCorp AS, juni 2022 - august 2022\nAssistert med rekruttering og opplæring av nye medarbeidere\nKoordinert med ulike avdelinger for å sikre smidig kommunikasjon"),
            (heading: "Ferdigheter:", body: "Kommunikasjon, Teamledelse, Rekruttering\nKonflikthåndtering og Medarbeiderutvikling"),
            (heading: "Sertifiseringer:", body: "Sertifisert HR Profesjonell"),
            (heading: "Referanser:", body: "Kan gis ved forespørsel"),
        ]
    )

    var body: some View {
        CVTemplateView(template: Self.template)
    }
}

struct HRCVView_Previews: PreviewProvider {
    static var previews: some View {
        HRCVView()
    }
}
