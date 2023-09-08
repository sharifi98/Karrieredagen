//
//  HosseinSharifiView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 07/09/2023.
//

import SwiftUI

struct HosseinSharifiView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Background2()
                VStack(alignment: .center) {
                    Image("hossein3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .clipped()
                        .clipShape(Circle())
                        .cornerRadius(10)
                        .overlay(
                            Circle()
                                .stroke(Color.orange, lineWidth: 10)
                        )
                    
                    VStack {
                        Text("Hossein Sharifi")
                            .font(.title)
                            .bold()
                        Text("iOS-Utvikler & Bookingansvarlig")
                            .italic()
                    }
                    .foregroundStyle(.white)
                    
                    
                    HStack {
                        if let url = URL(string: "https://www.linkedin.com/in/hossein-sharifi-a3b4431aa/") {
                            Link(destination: url) {
                                Image("linkedin")
                            }
                        }
                        
                        if let url = URL(string: "https://github.com/sharifi98") {
                            Link(destination: url) {
                                Image("github")
                            }
                        }
                    }
                    
                    

                    
                    Spacer()
                    
                    
                    
                }
            }
        }
        
        
        
        
    }
}


struct HosseinSharifi_Previews: PreviewProvider {
    static var previews: some View {
        HosseinSharifiView()
    }
}


