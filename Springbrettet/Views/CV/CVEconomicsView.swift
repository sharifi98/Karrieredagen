//
//  CVEconomicsView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 30/07/2023.
//

import SwiftUI

struct CVEconomicsView: View {
    var body: some View {
        List {
            VStack(alignment: .leading) {
                
                
                Text("CV - Økonomi")
                    .font(.system(size: 24))
                    .foregroundColor(Color("KDOrange"))
                
                Group {
                    Text("Personlige Detaljer:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Navn: Emil Økonomi\nAdresse: Finansveien 20, 5678 Økonomi, Norge\nTelefon: 87654321\nEpost: emil.oekonomi@example.com\nLinkedIn: linkedin.com/in/emil-økonomi")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                

                Group {
                    Text("Utdannelse:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Bachelor i Økonomi og Administrasjon, Handelshøyskolen BI, 2020 - 2023")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                
                Group {
                    Text("Arbeidserfaring:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Sommerintern, FinansGruppen AS, juni 2022 - august 2022\nUtformet en ny økonomisk rapporteringsmodell som forbedret effektiviteten med 15%\nJobbet i et team med fokus på Lean Six Sigma-prinsipper")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                Group {
                    Text("Ferdigheter:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Økonomisk analyse og modellering\nRegnskap\nMarkedsføringsstrategi")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                Group {
                    Text("Sertifiseringer:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Sertifisert i Lean Six Sigma Green Belt")
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

struct CVEconomicsView_Previews: PreviewProvider {
    static var previews: some View {
        CVEconomicsView()
    }
}
