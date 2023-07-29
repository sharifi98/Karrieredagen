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
                        GifImage("KDaftermovie_cropped")
                            .frame(width: 266, height: 150)
                            .clipped()
                            .cornerRadius(10)
                            .shadow(radius: 20)
                            .padding(30)
                        
                        Text("Vestlandets største tverrfaglige møteplass for bedrifter og studenter.")
                            .font(.custom("AvenirNext-Bold", size: 20))
                            .foregroundColor(Color("KDOrange"))
                            .lineSpacing(5)
                            
                        
                        Text("Karrieredagen er en mulighet for studenter til å inspireres av de utallige arbeidsmulighetene som finnes i jobbmarkedet. Samtidig som det er en flott anledning for bedrifter til å komme et skritt nærmere fremtidige arbeidstagere! \n\nVi er stolte over å være arrangør for Vestlandets største tverrfaglige møteplass som knytter studenter og arbeidsmarkedet tettere sammen.")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                            .padding(.horizontal, 15)
                            .lineSpacing(5)
                        

                    }
                    .padding()
                    .navigationBarWithTransparentBackground()
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarLeading) {
                            Text("Karrieredagen")
                                .font(.custom("AvenirNext-Bold", size: 20))
                                .foregroundColor(Color("KDOrange"))
                            
                        }
                    }
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
