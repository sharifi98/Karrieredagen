//
//  CV-ITView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 30/07/2023.
//

import SwiftUI

struct CVTemplate {
    let title: String
    let sections: [(heading: String, body: String)]
}

struct CVTemplateView: View {
    let template: CVTemplate

    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text(template.title)
                    .font(.system(size: 24))
                    .foregroundColor(Color.kdOrange)

                ForEach(template.sections.indices, id: \.self) { i in
                    let section = template.sections[i]
                    Group {
                        Text(section.heading)
                            .font(.headline)
                            .foregroundColor(Color.kdOrange)
                            .padding(.vertical)
                        Text(section.body)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding()
        }
        .listStyle(.grouped)
    }
}

struct CVITView: View {
    private static let template = CVTemplate(
        title: "CV - IT",
        sections: [
            (heading: "Personlige Detaljer:", body: "Navn: Ivar Informatikk\nAdresse: Dataveien 10, 1234 Programmering, Norge\nTelefon: 12345678\nEpost: ivar.informatikk@example.com\nLinkedIn: linkedin.com/in/ivar-informatikk"),
            (heading: "Utdannelse:", body: "Bachelor i Informatikk, Universitetet i Oslo, 2020 - 2023"),
            (heading: "Arbeidserfaring:", body: "Sommerintern, TechCorp AS, juni 2022 - august 2022\nUtviklet en mobilapp for intern bruk som forbedret produktiviteten med 20%\nJobbet i et agilt team og brukte Scrum-metodikk"),
            (heading: "Ferdigheter:", body: "Programmeringsspråk: Java, Python, C#\nProsjektledelse og Scrum\nMobilapputvikling"),
            (heading: "Sertifiseringer:", body: "Oracle Certified Professional, Java SE 8 Programmer"),
            (heading: "Referanser:", body: "Kan gis ved forespørsel"),
        ]
    )

    var body: some View {
        CVTemplateView(template: Self.template)
    }
}

struct CVITView_Previews: PreviewProvider {
    static var previews: some View {
        CVITView()
    }
}
