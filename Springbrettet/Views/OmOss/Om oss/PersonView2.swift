//
//  PersonView2.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 18/08/2023.
//

import SwiftUI

struct PersonView2: View {
    let leder: Leder

    var body: some View {
        List {

            VStack {

                Image(leder.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)

                VStack {
                    Text(leder.name)
                        .font(.custom("AvenirNext-Bold", size: 20))
                        .foregroundColor(Color("KDOrange"))
                    Text(leder.role)
                        .font(.custom("AvenirNext-Bold", size: 15))
                    Link(leder.email, destination: URL(string: "mailto:\(leder.email)")!)
                        .font(.custom("AvenirNext-Bold", size: 15))

                }
            }
        }
    }
}

struct PersonView2_Previews: PreviewProvider {
    static let leders: [Leder] = load("lederData.json")
    static var previews: some View {
        PersonView2(leder: leders[4])
    }
}
