//
//  HRCVView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 18/08/2023.
//

import SwiftUI

struct HRCVView: View {
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text("CV - HR")
                    .font(.system(size: 24))
                    .foregroundColor(Color("KDOrange"))
                
                Group {
                    Text("Personlige Detaljer:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Navn: Hanna HR\nAdresse: Personalveien 15, 5678 Ledelse, Norge\nTelefon: 87654321\nEpost: hanna.hr@example.com\nLinkedIn: linkedin.com/in/hanna-hr")
                        .font(.body)
                        .foregroundColor(.secondary)
                }

                Group {
                    Text("Utdannelse:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Bachelor i Human Resources, Universitetet i Oslo, 2020 - 2023")
                        .font(.body)
                        .foregroundColor(.secondary)
                }

                Group {
                    Text("Arbeidserfaring:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("HR Intern, PeopleCorp AS, juni 2022 - august 2022\nAssistert med rekruttering og opplæring av nye medarbeidere\nKoordinert med ulike avdelinger for å sikre smidig kommunikasjon")
                        .font(.body)
                        .foregroundColor(.secondary)
                }

                Group {
                    Text("Ferdigheter:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Kommunikasjon, Teamledelse, Rekruttering\nKonflikthåndtering og Medarbeiderutvikling")
                        .font(.body)
                        .foregroundColor(.secondary)
                }

                Group {
                    Text("Sertifiseringer:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Sertifisert HR Profesjonell")
                        .font(.body)
                        .foregroundColor(.secondary)
                }

                Group {
                    Text("Referanser:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Kan gis ved forespørsel")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
        }
        .listStyle(.grouped)
    }
}

struct HRCVView_Previews: PreviewProvider {
    static var previews: some View {
        HRCVView()
    }
}

