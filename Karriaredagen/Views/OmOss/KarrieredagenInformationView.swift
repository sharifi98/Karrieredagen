//
//  KarrieredagenInformationView.swift
//  Karrieredagen
//
//  Created by Hossein Sharifi on 24/06/2023.
//

import SwiftUI

struct KarrieredagenInformationView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(Color(red: 0.046, green: 0.127, blue: 0.21))
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        GifImage("KD21")
                            .frame(width: 270, height: 150)
                            .clipped()
                            .cornerRadius(15)
                            .shadow(radius: 20)
                        
                        Text("Karrieredagen er en mulighet for studenter til å inspireres av de utallige arbeidsmulighetene som finnes i jobbmarkedet.Samtidig som det er en flott anledning for bedrifter til å komme et skritt nærmere fremtidige arbeidstagere! \n\nVi er stolte over å være arrangør for Vestlandets største tverrfaglige møteplass som knytter studenter og arbeidsmarkedet tettere sammen.")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                            .padding(.horizontal, 15)
                            .lineSpacing(5)

                    }
                    .navigationTitle("Karrieredagen")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

struct KarrieredagenInformationView_Previews: PreviewProvider {
    static var previews: some View {
        KarrieredagenInformationView()
    }
}
