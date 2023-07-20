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
                Image("marinebackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack {
                        GifImage("KDaftermovie")
                            .frame(width: 266, height: 150)
                            .clipped()
                            .cornerRadius(10)
                            .shadow(radius: 20)
                            .padding(30)
                        
                        Text("Karrieredagen er en mulighet for studenter til å inspireres av de utallige arbeidsmulighetene som finnes i jobbmarkedet. Samtidig som det er en flott anledning for bedrifter til å komme et skritt nærmere fremtidige arbeidstagere! \n\nVi er stolte over å være arrangør for Vestlandets største tverrfaglige møteplass som knytter studenter og arbeidsmarkedet tettere sammen.")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                            .padding(.horizontal, 15)
                            .lineSpacing(5)
                        

                    }
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarLeading) {
                            Text("Karrieredagen")
                                .font(.system(size: 36, weight: .semibold))
                                .foregroundColor(Color("KDOrange"))
                        }
                    }
                    .navigationBarWithTransparentBackground()
                    .padding()
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
