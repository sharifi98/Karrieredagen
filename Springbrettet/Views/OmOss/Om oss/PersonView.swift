//
//  PersonView.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 02/08/2023.
//

import SwiftUI

struct PersonView: View {
    let person: Person
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                
                Image(person.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                    .clipped()
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                    .padding()
                
                VStack {
                    Text(person.name)
                        .font(.custom("AvenirNext-Bold", size: 20))
                        .foregroundColor(Color("KDOrange"))
                    Text(person.role)
                        .font(.custom("AvenirNext-Bold", size: 15))
                    Text(person.studie)
                        .font(.custom("AvenirNext-Bold", size: 15))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                    Link(person.email, destination: URL(string: "mailto:\(person.email)")!)
                        .font(.custom("AvenirNext-Bold", size: 15))
                }
                
                VStack {
                    if let url = URL(string: "\(person.linkedin)") {
                        Link(destination: url) {
                            Image("linkedin")
                        }
                    }
                }
                .padding()
                
                Spacer()
            }
            
        }
    }
}

struct PersonView_Previews: PreviewProvider {
    static let persons: [Person] = load("springbrettereData.json")
    static var previews: some View {
        PersonView(person: persons[4]) // Index 4 for Hossein Sharifi as an example
    }
}

