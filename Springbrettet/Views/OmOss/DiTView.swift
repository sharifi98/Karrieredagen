//
//  DiTView.swift
//  Karrieredagen
//
//  Created by Hossein Sharifi on 13/07/2023.
//

import SwiftUI

struct DiTView: View {
    var body: some View {
        ZStack {
            Image("marinebackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    Image("DIT1")
                        .resizable()
                        .frame(width: 400, height: 350)
                        .clipped()
                        .cornerRadius(10)
                    
                    Text("Damer i Toppen")
                        .foregroundColor(Color("KDOrange"))
                        .font(.custom("AvenirNext-Bold", size: 30))
                        .padding()
                    
                    
                    
                    
                    VStack {
                        
                        Text("Damer i Toppen er en prosjektgruppe under studentorganisasjonen Springbrettet. Vårt mål er å spre kunnskap om kjønnsubalansen på toppen av næringslivet og å inspirere og engasjere jenter til å tørre å bryte gjennom glasstaket.")
                            .foregroundColor(.white)
                        
                        Text("/n")
                        
                        Text("Vi jobber for å skape en fremtid der kvinner har like muligheter til å nå toppen av næringslivet som menn. Bli med oss i kampen for likestilling og bli en del av Damer i Toppen!")
                            .foregroundColor(.white)
                        
                    }
                    .padding(30)
                    
                    Link(destination: URL(string: "https://instagram.com/dameritoppen?igshid=MzRlODBiNWFlZA==")!) {
                        HStack {
                            Image("instagramreal")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .aspectRatio(contentMode: .fit)
                            Text("Følg oss på Instagram")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.pink)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 1)
                        )
                    }

                    
                    Link(destination: URL(string: "https://instagram.com/dameritoppen?igshid=MzRlODBiNWFlZA==")!) {
                        HStack {
                            Image("instagramreal")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .aspectRatio(contentMode: .fit)
                            Text("Følg oss på Instagram")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.pink)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 1)
                        )
                    }

                    
                    
                    
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
