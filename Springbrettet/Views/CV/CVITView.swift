//
//  CV-ITView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 30/07/2023.
//

import SwiftUI

import SwiftUI

struct CVITView: View {
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Group {
                        Text("CV - IT")
                            .font(.system(size: 24))
                            .foregroundColor(Color("KDOrange"))
                        
                        sectionView(title: "Personlige Detaljer:", content: """
                            Navn: Ivar Informatikk
                            Adresse: Dataveien 10, 1234 Programmering, Norge
                            Telefon: 12345678
                            Epost: ivar.informatikk@example.com
                            LinkedIn: linkedin.com/in/ivar-informatikk
                            """)
                        
                        sectionView(title: "Utdannelse:", content: """
                            Bachelor i Informatikk, Universitetet i Oslo, 2020 - 2023
                            """)
                        
                        sectionView(title: "Arbeidserfaring:", content: """
                            Sommerintern, TechCorp AS, juni 2022 - august 2022
                            Utviklet en mobilapp for intern bruk som forbedret produktiviteten med 20%
                            Jobbet i et agilt team og brukte Scrum-metodikk
                            """)
                    }
                    
                    Group {
                        sectionView(title: "Ferdigheter:", content: """
                            Programmeringsspråk: Java, Python, C#
                            Prosjektledelse og Scrum
                            Mobilapputvikling
                            """)
                        
                        sectionView(title: "Sertifiseringer:", content: """
                            Oracle Certified Professional, Java SE 8 Programmer
                            """)
                        
                        sectionView(title: "Referanser:", content: """
                            Kan gis ved forespørsel
                            """)
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
        }
    }
    
    func sectionView(title: String, content: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 20))
                .foregroundColor(Color("KDOrange"))
            Text(content)
                .font(.body)
                .foregroundColor(.secondary)
                .padding()
        }
    }
}

struct CVITView_Previews: PreviewProvider {
    static var previews: some View {
        CVITView()
    }
}

