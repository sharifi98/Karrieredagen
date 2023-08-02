//
//  CV-ITView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 30/07/2023.
//

import SwiftUI

struct CVITView: View {
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text("CV - IT")
                    .font(.system(size: 24))
                    .foregroundColor(Color("KDOrange"))
                
                Group {
                    Text("Personlige Detaljer:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Navn: Ivar Informatikk\nAdresse: Dataveien 10, 1234 Programmering, Norge\nTelefon: 12345678\nEpost: ivar.informatikk@example.com\nLinkedIn: linkedin.com/in/ivar-informatikk")
                        .font(.body)
                        .foregroundColor(.secondary)
                }

                Group {
                    Text("Utdannelse:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Bachelor i Informatikk, Universitetet i Oslo, 2020 - 2023")
                        .font(.body)
                        .foregroundColor(.secondary)
                }

                Group {
                    Text("Arbeidserfaring:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Sommerintern, TechCorp AS, juni 2022 - august 2022\nUtviklet en mobilapp for intern bruk som forbedret produktiviteten med 20%\nJobbet i et agilt team og brukte Scrum-metodikk")
                        .font(.body)
                        .foregroundColor(.secondary)
                }

                Group {
                    Text("Ferdigheter:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Programmeringsspråk: Java, Python, C#\nProsjektledelse og Scrum\nMobilapputvikling")
                        .font(.body)
                        .foregroundColor(.secondary)
                }

                Group {
                    Text("Sertifiseringer:")
                        .font(.headline)
                        .foregroundColor(Color("KDOrange"))
                        .padding(.vertical)
                    Text("Oracle Certified Professional, Java SE 8 Programmer")
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

struct CVITView_Previews: PreviewProvider {
    static var previews: some View {
        CVITView()
    }
}
