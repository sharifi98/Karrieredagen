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
