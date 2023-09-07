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
                Background()
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

struct Background: View{
    
    let colors: [Color] = [Color(#colorLiteral(red: 0.1407667696, green: 0.5089942217, blue: 0.5972044468, alpha: 1)), Color(#colorLiteral(red: 0.1079011187, green: 0.3485074937, blue: 0.4073579013, alpha: 1)), Color(#colorLiteral(red: 0.09506385773, green: 0.2428356409, blue: 0.2807130218, alpha: 1)), Color(#colorLiteral(red: 0.08821473271, green: 0.1449819803, blue: 0.1618441939, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1))]
    
    var body: some View{
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    HosseinSharifiView()
}
