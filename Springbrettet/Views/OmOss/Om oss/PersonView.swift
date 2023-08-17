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
        List {
            
            VStack {
                
                Image(person.imageName) // Assuming your Person struct has a imageName property
                    .resizable() // Add this line to let image resize itself
                    .aspectRatio(contentMode: .fill) // Preserve the aspect ratio of original image
                
                VStack {
                    Text(person.name)
                        .font(.custom("AvenirNext-Bold", size: 20))
                        .foregroundColor(Color("KDOrange"))
                    Text(person.role)
                        .font(.custom("AvenirNext-Bold", size: 15))
                    Text(person.studie)
                        .font(.custom("AvenirNext-Bold", size: 15))
                        .foregroundColor(.secondary)
                    Link(person.email, destination: URL(string: "mailto:\(person.email)")!)
                        .font(.custom("AvenirNext-Bold", size: 15))

                }
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

