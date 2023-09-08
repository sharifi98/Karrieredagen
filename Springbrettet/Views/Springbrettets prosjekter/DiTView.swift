//
//  DiTView.swift
//  Karrieredagen
//
//  Created by Hossein Sharifi on 13/07/2023.
//

import SwiftUI

struct DiTView: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                Background()
                ScrollView {
                    Image("DIT2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 250)
                    
                    Text("Damer i Toppen er en prosjektgruppe under studentorganisasjonen Springbrettet. Vårt mål er å spre kunnskap om kjønnsubalansen på toppen av næringslivet og å inspirere og engasjere jenter til å tørre å bryte gjennom glasstaket.")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding(20)
                    
                    Text("Vi jobber for å skape en fremtid der kvinner har like muligheter til å nå toppen av næringslivet som menn. Bli med oss i kampen for likestilling og bli en del av Damer i Toppen!")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding(20)
                    
                    VStack {
                        Link(destination: URL(string: "https://www.facebook.com/groups/928191017996338/?hoisted_section_header_type=recently_seen&multi_permalinks=1167470484068389")!) {
                            Label("Følg oss på Facebook", systemImage: "person")
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: 200)
                        .padding()
                        .background(Color("KDOrange"))
                        .cornerRadius(10)
                        
                        
                        Link(destination: URL(string: "https://instagram.com/dameritoppen?igshid=MzRlODBiNWFlZA==")!) {
                            Label("Følg oss på Instagram", systemImage: "camera")
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: 200)
                        .padding()
                        .background(Color("KDOrange"))
                        .cornerRadius(10)
                    }
                    .padding()
                    
                    
                    
                    
                }
            }
        }
        
        
    }
}

struct DiTView_Previews: PreviewProvider {
    static var previews: some View {
        DiTView()
    }
}
