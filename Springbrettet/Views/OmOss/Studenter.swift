//
//  Studenter.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 08/08/2023.
//

import SwiftUI

struct Studenter: View {
    var body: some View {
        VStack {
            List { // Add some spacing between Text views
                Section {
                    Text("Ta kontakt")
                        .font(.custom("AvenirNext-Bold", size: 30))
                        .foregroundColor(Color("KDOrange"))
                    Text("Vil du vite mer om oss i Springbrettet? Sjekk oss gjerne ut på sosiale medier, og ikke nøl med å henvende deg på mail eller Facebook for spørsmål!\n\nInteressert i å bli medlem i Springbrettet? Vi rekrutterer i starten av hvert semester. Følg med på facebook og hjemmesiden vår for mer informasjon!")
                        .font(.custom("AvenirNext-Regular", size: 20))
                    // Replace "TextColor" with the appropriate color name if needed
                        .padding() // Add some padding around the text
                }
                
                Section {
                    
                    // change to correct linking and buttons
                    
                    Link(destination: URL(string: "https://www.instagram.com/springbrettet/")!) {
                        Label("Instagram", systemImage: "camera")
                    }
                    .foregroundColor(.pink)
                    
                    Link(destination: URL(string: "https://www.facebook.com/springbrettet")!) {
                        Label("Facebook", systemImage: "person")
                    }
                    .foregroundColor(.blue)
                    
                    Link(destination: URL(string: "https://www.linkedin.com/company/springbrettet/mycompany/")!) {
                        Label("LinkedIn", systemImage: "point.3.filled.connected.trianglepath.dotted")
                    }
                    .foregroundColor(.cyan)

                }
            }
            



        }
        
        
    }
}

struct Studenter_Previews: PreviewProvider {
    static var previews: some View {
        Studenter()
    }
}
