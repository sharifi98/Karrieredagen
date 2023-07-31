//
//  CVJussView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 30/07/2023.
//

import SwiftUI

struct CVJussView: View {
    var body: some View {
        List {
            VStack(alignment: .leading) {
                
                Text("CV - Juss")
                    .font(.system(size: 24))
                    .foregroundColor(Color("KDOrange"))
                
                Group {
                    Text("Personlige Detaljer:")
                            .font(.headline)
                            .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                
                    Text("Navn: Laura Lov\nAdresse: Juridisk Jentevei 30, 9012 Juss, Norge\nTelefon: 87654321\nEpost: laura.lov@example.com\nLinkedIn: linkedin.com/in/laura-lov")
                        .font(.body)
                        .foregroundColor(.secondary)
                
                
             
                    Text("Utdannelse:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Bachelor i Jus, Universitetet i Oslo, 2020 - 2023")
                        .font(.body)
                        .foregroundColor(.secondary)
             
                }
             
                    Text("Arbeidserfaring:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Sommerintern, Lov og Rett AS, juni 2022 - august 2022\nUtførte juridisk forskning for pågående rettssaker\nBidro i utformingen av juridiske dokumenter og korrespondanse")
                        .font(.body)
                        .foregroundColor(.secondary)
             
                
             
                    Text("Ferdigheter:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Juridisk forskning og skriving\nGrunnleggende prosessrett\nForhandling og megling")
                        .font(.body)
                        .foregroundColor(.secondary)
             
             
                    Text("Sertifiseringer:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Sertifisert i juridisk forskning og skriving")
                        .font(.body)
                        .foregroundColor(.secondary)
             
                    Text("Referanser:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Kan gis ved forespørsel")
                        .font(.body)
                        .foregroundColor(.secondary)

            }

            .padding()
        }
        .listStyle(.grouped)
    }
}

struct CVJussView_Previews: PreviewProvider {
    static var previews: some View {
        CVJussView()
    }
}
